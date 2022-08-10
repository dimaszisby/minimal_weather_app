import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:minimal_weather_app/data/constants.dart';
import 'package:minimal_weather_app/domain/entities/current_weather.dart';
import 'package:minimal_weather_app/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:minimal_weather_app/presentation/bloc/current_weather/current_weather_event.dart';
import 'package:minimal_weather_app/presentation/bloc/current_weather/current_weather_state.dart';
import 'package:minimal_weather_app/presentation/ui/organisms/page_current_weather.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherBloc extends MockBloc<CurrentWeatherEvent, CurrentWeatherState>
    implements CurrentWeatherBloc {}

class FakeWeatherState extends Fake implements CurrentWeatherState {}

class FakeWeatherEvent extends Fake implements CurrentWeatherEvent {}

void main() {
  late MockWeatherBloc mockWeatherBloc;

  setUpAll(() async {
    HttpOverrides.global = null;
    registerFallbackValue(FakeWeatherState());
    registerFallbackValue(FakeWeatherEvent());

    final di = GetIt.instance;
    di.registerFactory(() => mockWeatherBloc);
  });

  setUp(() {
    mockWeatherBloc = MockWeatherBloc();
  });

  const tWeather = CurrentWeatherEntity(
    lon: 6.2088,
    lat: 106.8456,
    main: 'cloudy',
    iconCode: '04d',
    temperature: 31,
    maxTemperature: 34,
    minTemperature: 26,
    pressure: 1000,
    humidity: 1000,
    cloud: 100,
    winSpeed: 3,
    visibility: 1000,
  );

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<CurrentWeatherBloc>.value(
      value: mockWeatherBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    'text field should trigger state to change from empty to loading',
    (WidgetTester tester) async {
      // arrange
      when(() => mockWeatherBloc.state).thenReturn(WeatherEmpty());

      // act
      await tester.pumpWidget(_makeTestableWidget(const CurrentWeatherView()));
      // await tester.enterText(find.byType(TextField), 'Jakarta');
      // await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // assert
      verify(() => mockWeatherBloc.add(const OnCoordinateChanged(lon: 6.2088, lat:106.8456))).called(1);
      expect(find.byType(TextField), equals(findsOneWidget));
    },
  );

  testWidgets(
    'should show progress indicator when state is loading',
    (WidgetTester tester) async {
      // arrange
      when(() => mockWeatherBloc.state).thenReturn(WeatherLoading());

      // act
      await tester.pumpWidget(_makeTestableWidget(const CurrentWeatherView()));

      // assert
      expect(find.byType(CircularProgressIndicator), equals(findsOneWidget));
    },
  );

  testWidgets(
    'should show widget contain weather data when state is has data',
    (WidgetTester tester) async {
      // arrange
      when(() => mockWeatherBloc.state).thenReturn(const WeatherHasData(tWeather));

      // act
      await tester.pumpWidget(_makeTestableWidget(const CurrentWeatherView()));
      await tester.runAsync(() async {
        final HttpClient client = HttpClient();
        await client.getUrl(Uri.parse(Urls.weatherIcon('02d')));
      });
      await tester.pumpAndSettle();

      // assert
      expect(find.byKey(const Key('weather_data')), equals(findsOneWidget));
    },
  );
}

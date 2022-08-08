import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_weather_app/data/failure.dart';
import 'package:minimal_weather_app/domain/entities/current_weather.dart';
import 'package:minimal_weather_app/domain/usecases/get_current_weather.dart';
import 'package:minimal_weather_app/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:minimal_weather_app/presentation/bloc/current_weather/current_weather_event.dart';
import 'package:minimal_weather_app/presentation/bloc/current_weather/current_weather_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_bloc_test.mocks.dart';

@GenerateMocks([GetCurrentWeather])
void main() {
  late MockGetCurrentWeather mockGetCurrentWeather;
  late CurrentWeatherBloc weatherBloc;

  setUp(() {
    mockGetCurrentWeather = MockGetCurrentWeather();
    weatherBloc = CurrentWeatherBloc(mockGetCurrentWeather);
  });

  const tWeather = CurrentWeather(
    lon: 6.2088,
    lat: 106.8456,
    main: 'cloudy',
    iconCode: '04d',
    temperature: 31,
    maxTemperature: 34,
    minTemperature: 26,
    pressure: 1000,
    humidity: 1000,
    cloud: 'cloud',
    winSpeed: 3,
    visibility: 1000,
  );

  const tCityName = 'Jakarta';
  const tLon = 106.8456;
  const tLat = 6.2088;

  test(
    'initial state should be empty',
    () {
      expect(weatherBloc.state, WeatherEmpty());
    },
  );

  blocTest<CurrentWeatherBloc, CurrentWeatherState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(mockGetCurrentWeather.execute(tLon, tLat))
          .thenAnswer((_) async => const Right(tWeather));
      return weatherBloc;
    },
    act: (bloc) => bloc.add(const OnCoordinateChanged(lon: tLon, lat: tLat)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      WeatherLoading(),
     const WeatherHasData(tWeather),
    ],
    verify: (bloc) {
      verify(mockGetCurrentWeather.execute(tLon, tLat));
    },
  );

  blocTest<CurrentWeatherBloc, CurrentWeatherState>(
    'should emit [loading, error] when get data is unsuccessful',
    build: () {
      when(mockGetCurrentWeather.execute(tLon, tLat))
          .thenAnswer((_) async => const Left(ServerFailure('Server failure')));
      return weatherBloc;
    },
    act: (bloc) => bloc.add(const OnCoordinateChanged(lon: tLon, lat: tLat)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      WeatherLoading(),
      const WeatherError('Server failure'),
    ],
    verify: (bloc) {
      verify(mockGetCurrentWeather.execute(tLon, tLat));
    },
  );
}

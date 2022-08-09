import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_weather_app/domain/entities/current_weather.dart';
import 'package:minimal_weather_app/domain/usecases/get_current_weather.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockWeatherRepository mockWeatherRepository;
  late GetCurrentWeather usecase;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetCurrentWeather(mockWeatherRepository);
  });

  const testWeatherDetail = CurrentWeatherEntity(
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

  const tCityName = 'Jakarta';
  const tLon = 106.8456;
  const tLat = 6.2088;

  test(
    'should get current weather detail from the repository',
    () async {
      // arrange
      when(mockWeatherRepository.getCurrentWeather(tLon, tLat))
          .thenAnswer((_) async => const Right(testWeatherDetail));

      // act
      final result = await usecase.execute(tLon, tLat);

      // assert
      expect(result, equals(const Right(testWeatherDetail)));
    },
  );
}

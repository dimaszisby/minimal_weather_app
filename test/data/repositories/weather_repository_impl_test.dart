import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_weather_app/data/exception.dart';
import 'package:minimal_weather_app/data/failure.dart';
import 'package:minimal_weather_app/data/models/current_weather_model.dart';
import 'package:minimal_weather_app/data/repositories/weather_repository_impl.dart';
import 'package:minimal_weather_app/domain/entities/current_weather.dart';
import 'package:mockito/mockito.dart';


import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late WeatherRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = WeatherRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  final tCurrentWeatherModel = CurrentWeatherModel(
    lon: 6.2088,
    lat: 106.8456,
    main: 'cloudy',
    temperature: 31,
    maxTemperature: 34,
    minTemperature: 26,
    pressure: 1000,
    humidity: 1000,
    cloud: 'cloud',
    winSpeed: 3,
    visibility: 1000,
  );

  final tCurrentWeather = CurrentWeather(
    lon: 6.2088,
    lat: 106.8456,
    main: 'cloudy',
    temperature: 31,
    maxTemperature: 34,
    minTemperature: 26,
    pressure: 1000,
    humidity: 1000,
    cloud: 'cloud',
    winSpeed: 3,
    visibility: 1000,
  );

  group('get current weather', () {
    final tCityName = 'Jakarta';
    final tLon = 106.8456;
    final tLat = 6.2088;

    test(
      'should return current weather when a call to data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getCurrentWeather(tLon, tLat))
            .thenAnswer((_) async => tCurrentWeatherModel);

        // act
        final result = await repository.getCurrentWeather(tLon, tLat);

        // assert
        verify(mockRemoteDataSource.getCurrentWeather(tLon, tLat));
        expect(result, equals(Right(tCurrentWeather)));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getCurrentWeather(tLon, tLat))
            .thenThrow(ServerException());

        // act
        final result = await repository.getCurrentWeather(tLon, tLat);

        // assert
        verify(mockRemoteDataSource.getCurrentWeather(tLon, tLat));
        expect(result, equals(Left(ServerFailure(''))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getCurrentWeather(tLon, tLat))
            .thenThrow(SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getCurrentWeather(tLon, tLat);

        // assert
        verify(mockRemoteDataSource.getCurrentWeather(tLon, tLat));
        expect(
          result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))),
        );
      },
    );
  });
}

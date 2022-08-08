import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_weather_app/data/models/current_weather_model.dart';
import 'package:minimal_weather_app/domain/entities/current_weather.dart';

import '../../helpers/json_reader.dart';

void main() {
  final tWeatherModel = CurrentWeatherModel(
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

  group('to entity', () {
    test(
      'should be a subclass of weather entity',
      () async {
        // assert
        final result = tWeatherModel.toEntity();
        expect(result, equals(tWeather));
      },
    );
  });

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(
          readJson('helpers/dummy_data/dummy_weather_response.json'),
        );

        // act
        final result = CurrentWeatherModel.fromJson(jsonMap);

        // assert
        expect(result, equals(tWeatherModel));
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        // act
        final result = tWeatherModel.toJson();

        // assert
        final expectedJsonMap = {
          'weather': [
            {
              'main': 'Clouds',
              'description': 'few clouds',
              'icon': '02d',
            }
          ],
          'main': {
            'temp': 302.28,
            'pressure': 1009,
            'humidity': 70,
          },
          'name': 'Jakarta',
        };
        expect(result, equals(expectedJsonMap));
      },
    );
  });
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:minimal_weather_app/data/models/forecast_weather_model.dart';

import '../constants.dart';
import '../exception.dart';
import '../models/current_weather_model.dart';

abstract class RemoteDataSource {
  Future<CurrentWeatherModel> getCurrentWeather(num lon, num lat);
  Future<ForecastWeatherModel> getForecastWeather(num lon, num lat);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<CurrentWeatherModel> getCurrentWeather(num lon, num lat) async {
    final response = await client.get(Uri.parse(Urls.currentWeather(lon, lat)));
    if (response.statusCode == 200) {
      return CurrentWeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ForecastWeatherModel> getForecastWeather(
      num lon, num lat) async {
    final response =
        await client.get(Uri.parse(Urls.forecastWeather(lon, lat)));
    if (response.statusCode == 200) {
      return ForecastWeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}

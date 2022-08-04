import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../exception.dart';
import '../models/current_weather_model.dart';

abstract class RemoteDataSource {
  Future<CurrentWeatherModel> getCurrentWeather(double lat, double long);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<CurrentWeatherModel> getCurrentWeather(double lat, double long) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeather(lat, long)));
    if (response.statusCode == 200) {
      return CurrentWeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}

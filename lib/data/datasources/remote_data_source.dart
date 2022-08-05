import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../exception.dart';
import '../models/current_weather_model.dart';

abstract class RemoteDataSource {
  Future<CurrentWeatherModel> getCurrentWeather(double lon, double lat);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});
  
  //NOTE: Static Value fo
  // final tLon = 106.8456;
  // final tLat = 6.2088;

  @override
  Future<CurrentWeatherModel> getCurrentWeather(double lon, double lat) async {
    print('[RDS]: Getting Reponse');
    final response =
        await client.get(Uri.parse(Urls.currentWeather(lon, lat)));
        print(response.body);
        
    if (response.statusCode == 200) {
      return CurrentWeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}

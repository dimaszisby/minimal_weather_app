import 'dart:convert';
import 'package:flutter/material.dart';

import '../../domain/entities/current_weather.dart';

CurrentWeatherModel currentWeatherModelFromJson(String str) =>
    CurrentWeatherModel.fromJson(json.decode(str));

String currentWeatherModelToJson(CurrentWeatherModel data) =>
    json.encode(data.toJson());

class CurrentWeatherModel with ChangeNotifier {
  CurrentWeatherModel({
    required this.lon, //coord --> lon
    required this.lat, //coord --> lat
    required this.main, //weather ->main (the weather condition)
    required this.iconCode,
    required this.temperature, // main -> temp
    required this.minTemperature, //main -> temp_min
    required this.maxTemperature, //main -> temp_max
    required this.pressure, //main -> pressure
    required this.humidity, //main -> humidity
    required this.winSpeed, //wind -> speed
    required this.cloud, //weater -> description
    required this.visibility, //visisibility
  });

  final double lon;
  final double lat;
  final String main;
  final String iconCode;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final int pressure;
  final int humidity;
  final double winSpeed;
  final int cloud;
  final int visibility;

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherModel(
        lon: json['coord']['lon'],
        lat: json['coord']['lat'],
        main: json['weather'][0]['main'],
        iconCode: json['weather'][0]['icon'],
        temperature: json['main']['temp'],
        minTemperature: json['main']['temp_min'],
        maxTemperature: json['main']['temp_max'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        winSpeed: json['wind']['speed'],
        cloud: json['clouds']['all'],
        visibility: json['visibility'],
      );

  Map<String, dynamic> toJson() => {
        'coord': [
          {
            'lon': lon,
            'lat': lat,
          }
        ],
        'weather': [
          {
            'main': main,
          },
        ],
        'main': {
          'icon': iconCode,
          'temp': temperature,
          'temp_max': maxTemperature,
          'temp_min': minTemperature,
          'pressure': pressure,
          'humidity': humidity,
        },
        'wind': {
          'speed': winSpeed,
        },
        'visibility': visibility,
        'clouds': {
          'all': cloud,
        }
      };

  CurrentWeather toEntity() => CurrentWeather(
        lon: lon,
        lat: lat,
        main: main,
        iconCode: iconCode,
        temperature: temperature,
        minTemperature: minTemperature,
        maxTemperature: maxTemperature,
        pressure: pressure,
        humidity: humidity,
        winSpeed: winSpeed,
        cloud: cloud,
        visibility: visibility,
      );

  @override
  List<Object?> get props => [
        lon,
        lat,
        main,
        iconCode,
        temperature,
        minTemperature,
        maxTemperature,
        pressure,
        humidity,
        winSpeed,
        cloud,
        visibility,
      ];
}

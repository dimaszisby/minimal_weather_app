import 'dart:convert';
import 'package:flutter/material.dart';

import '../../domain/entities/forecast_weather.dart';

ForecastWeatherModel currentWeatherModelFromJson(String str) =>
    ForecastWeatherModel.fromJson(json.decode(str));

String currentWeatherModelToJson(ForecastWeatherModel data) =>
    json.encode(data.toJson());

class ForecastWeatherModel with ChangeNotifier {
  ForecastWeatherModel({
    required this.main,
    required this.iconCode,
    required this.dateTime,
    required this.temperature,
    required this.winSpeed,
  });

  final String main;
  final String iconCode;
  final String dateTime;
  final double temperature;
  final double winSpeed;

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) =>
      ForecastWeatherModel(
        main: json['list']['weather'][0]['main'],
        iconCode: json['list']['weather'][0]['icon'],
        dateTime: json['list']['dt_txt'],
        temperature: json['list']['main']['temp'],
        winSpeed: json['list']['wind']['speed'],
      );

  Map<String, dynamic> toJson() => {
        'list': [
          {
            'weather': [
              {
                'main': main,
              },
            ],
            'main': {
              'icon': iconCode,
              'temp': temperature,
            },
            'wind': {
              'speed': winSpeed,
            },
            'dt_txt': dateTime,
          }
        ]
      };

  ForecastWeather toEntity() => ForecastWeather(
        main: main,
        iconCode: iconCode,
        dateTime: dateTime,
        temperature: temperature,
        winSpeed: winSpeed,
      );

  @override
  List<Object?> get props => [
        main,
        iconCode,
        temperature,
        winSpeed,
      ];
}

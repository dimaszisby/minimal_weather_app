import 'dart:convert';

import '../../domain/entities/forecast_weather.dart';

ForecastWeatherModel currentWeatherModelFromJson(String str) =>
    ForecastWeatherModel.fromJson(json.decode(str));

String currentWeatherModelToJson(ForecastWeatherModel data) =>
    json.encode(data.toJson());

class ForecastWeatherModel {
  late List<ForecastWeatherItem> forecastItems;

  ForecastWeatherModel({required this.forecastItems});

  ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      forecastItems = <ForecastWeatherItem>[];
      json['list'].forEach((v) {
        forecastItems.add(ForecastWeatherItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
        'list': forecastItems,
      };

  ForecastWeatherEntity toEntity() =>
      ForecastWeatherEntity(forecastItems: forecastItems);

  @override
  List<Object?> get props => [forecastItems];
}

class ForecastWeatherItem extends ForecastItemEntity {
  ForecastWeatherItem({
    required this.main,
    required this.iconCode,
    required this.dateTime,
    required this.temperature,
    required this.winSpeed,
  }) : super(
          main: main,
          iconCode: iconCode,
          dateTime: dateTime,
          temperature: temperature,
          winSpeed: winSpeed,
        );

  final String main;
  final String iconCode;
  final String dateTime;
  final double temperature;
  final num winSpeed;

  factory ForecastWeatherItem.fromJson(Map<String, dynamic> json) =>
      ForecastWeatherItem(
        main: json['weather'][0]['main'],
        iconCode: json['weather'][0]['icon'],
        dateTime: json['dt_txt'],
        temperature: json['main']['temp'],
        winSpeed: json['wind']['speed'],
      );

  Map<String, dynamic> toJson() => {
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
      };

  ForecastItemEntity toEntity() => ForecastItemEntity(
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

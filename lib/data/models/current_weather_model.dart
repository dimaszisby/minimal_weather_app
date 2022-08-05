import 'dart:convert';

import 'package:flutter/material.dart';

import '/domain/entities/current_weather.dart';

CurrentWeatherModel currentWeatherModelFromJson(String str) =>
    CurrentWeatherModel.fromJson(json.decode(str));

String currentWeatherModelToJson(CurrentWeatherModel data) =>
    json.encode(data.toJson());

class CurrentWeatherModel with ChangeNotifier{
  CurrentWeatherModel({
    required this.lon, //coord --> lon
    required this.lat, //coord --> lat
    required this.main, //weather ->main (the weather condition)
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
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double pressure;
  final double humidity;
  final double winSpeed;
  final String cloud;
  final double visibility;

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherModel(
        lon: json['coord'][0]['lon'],
        lat: json['coord'][0]['lat'],
        main: json['weather'][0]['main'],
        temperature: json['main'][0]['temp'],
        minTemperature: json['main'][0]['temp_min'],
        maxTemperature: json['main'][0]['temp_max'],
        pressure: json['main'][0]['pressure'],
        humidity: json['main'][0]['humidity'],
        winSpeed: json['wind'][0]['speed'],
        cloud: json['wheater'][0]['description'],
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
            'description': cloud,
          },
        ],
        'main': {
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
      };

  CurrentWeather toEntity() => CurrentWeather(
        lon: lon,
        lat: lat,
        main: main,
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


  // lon;
  // lat;
  // main;
  //  temperature;
  //  minTemperature;
  //  maxTemperature;
  // pressure;
  //  humidity;
  //  winSpeed;
  //  cloud;
  //  visibility;
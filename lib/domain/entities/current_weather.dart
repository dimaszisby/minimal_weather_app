import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable {
  CurrentWeather({
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

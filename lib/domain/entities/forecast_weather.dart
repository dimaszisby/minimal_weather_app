import 'package:equatable/equatable.dart';

class ForecastWeather extends Equatable {
  const ForecastWeather({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.forecastList,
  });

  final String cod;
  final int message;
  final int cnt;
  final List<ForecastList> forecastList;

  @override
  List<Object?> get props => [
        cod,
        message,
        cnt,
        forecastList,
      ];
}

class ForecastList extends Equatable {
  const ForecastList({
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

  @override
  List<Object?> get props => [
        main,
        iconCode,
        dateTime,
        temperature,
        winSpeed,
      ];
}

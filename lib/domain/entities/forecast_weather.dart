import 'package:equatable/equatable.dart';

class ForecastWeather extends Equatable {
  const ForecastWeather({
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

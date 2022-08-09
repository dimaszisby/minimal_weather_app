import 'package:equatable/equatable.dart';

import '../../../domain/entities/current_weather.dart';

abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherEmpty extends CurrentWeatherState {}

class WeatherLoading extends CurrentWeatherState {}

class WeatherError extends CurrentWeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object?> get props => [message];
}

class WeatherHasData extends CurrentWeatherState {
  final CurrentWeatherEntity result;

  const WeatherHasData(this.result);

  @override
  List<Object?> get props => [result];
}

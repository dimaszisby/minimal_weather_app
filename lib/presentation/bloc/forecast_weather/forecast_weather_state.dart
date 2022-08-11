import 'package:equatable/equatable.dart';

import '../../../domain/entities/forecast_weather.dart';

abstract class ForecastWeatherState extends Equatable {
  const ForecastWeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherEmpty extends ForecastWeatherState {}

class WeatherLoading extends ForecastWeatherState {}

class WeatherError extends ForecastWeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object?> get props => [message];
}

class WeatherHasData extends ForecastWeatherState {
  final List<ForecastItemEntity> result;

  const WeatherHasData({required this.result});

  @override
  List<Object?> get props => [result];
}

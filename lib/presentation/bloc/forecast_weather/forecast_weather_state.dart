import 'package:equatable/equatable.dart';
import 'package:minimal_weather_app/domain/entities/forecast_weather.dart';

import '../../../domain/entities/current_weather.dart';

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
  final ForecastWeatherEntity result;

  const WeatherHasData(this.result);

  @override
  List<Object?> get props => [result];
}

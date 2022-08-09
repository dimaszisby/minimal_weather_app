import 'package:dartz/dartz.dart';
import 'package:minimal_weather_app/domain/entities/forecast_weather.dart';

import '../../data/failure.dart';
import '../entities/current_weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, CurrentWeatherEntity>> getCurrentWeather(
      double lon, double lat);

  Future<Either<Failure, ForecastWeatherEntity>> getForecastWeather(double lon, double lat);
}

import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../entities/current_weather.dart';
import '../entities/forecast_weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, CurrentWeatherEntity>> getCurrentWeather(
      num lon, num lat);

  Future<Either<Failure, ForecastWeatherEntity>> getForecastWeather(double lon, double lat);
}

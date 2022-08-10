import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../../domain/entities/forecast_weather.dart';
import '../repositories/weather_repository.dart';

class GetForecastWeather {
  final WeatherRepository repository;

  GetForecastWeather(this.repository);

  Future<Either<Failure, ForecastWeatherEntity>> execute(
      double lon, double lat) {
    print('[Use case]: GET current weather');
    return repository.getForecastWeather(lon, lat);
  }
}

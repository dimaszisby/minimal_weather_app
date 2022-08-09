import 'package:dartz/dartz.dart';
import 'package:minimal_weather_app/domain/entities/forecast_weather.dart';

import '../../data/failure.dart';
import '../repositories/weather_repository.dart';

class GetForecastWeather{
  final WeatherRepository repository;

  GetForecastWeather(this.repository);

  Future<Either<Failure, ForecastWeatherEntity>> execute(double lon, double lat) {
    print('[Use case]: GET current weather');
    return repository.getForecastWeather(lon, lat);
  }
}

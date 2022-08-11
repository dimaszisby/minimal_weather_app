import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../entities/current_weather.dart';
import '../repositories/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Either<Failure, CurrentWeatherEntity>> execute(num lon, num lat) {
    print('[Use case]: GET current weather');
    return repository.getCurrentWeather(lon, lat);
  }
}

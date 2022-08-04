import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../../data/models/current_weather_model.dart';
import '../repositories/weather_repository.dart';


class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Either<Failure, Weather>> execute(double lat, double long) {
    return repository.getCurrentWeather(lat, long);
  }
}

import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../../data/models/current_weather_model.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(double lat, double lon);
}

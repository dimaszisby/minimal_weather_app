import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../entities/current_weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, CurrentWeather>> getCurrentWeather(double lon, double lat);
}

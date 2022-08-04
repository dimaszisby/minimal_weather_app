import 'dart:io';

import 'package:flutter_weather_app_sample/data/datasources/remote_data_source.dart';
import 'package:flutter_weather_app_sample/data/exception.dart';
import 'package:flutter_weather_app_sample/domain/entities/weather.dart';
import 'package:flutter_weather_app_sample/data/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app_sample/domain/repositories/weather_repository.dart';

import '../../domain/entities/current_weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/remote_data_source.dart';
import '../exception.dart';
import '../failure.dart';



class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(double lat, double lon) async {
    try {
      final result = await remoteDataSource.getCurrentWeather(lat, lon);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}

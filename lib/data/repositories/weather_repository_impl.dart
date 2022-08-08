import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:minimal_weather_app/domain/entities/forecast_weather.dart';

import '../../domain/entities/current_weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/remote_data_source.dart';
import '../exception.dart';
import '../failure.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CurrentWeather>> getCurrentWeather(double lon, double lat) async {
    try {
      final result = await remoteDataSource.getCurrentWeather(lon, lat);
      print('[REPO Impl]: ${result.props}');
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  Future<Either<Failure, ForecastWeather>> getForecastWeather(double lon, double lat) async {
        try {
      final result = await remoteDataSource.getForecastWeather(lon, lat);
      print('[REPO Impl]: ${result.props}');
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

}

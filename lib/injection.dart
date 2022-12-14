import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import './data/datasources/remote_data_source.dart';
import './data/repositories/weather_repository_impl.dart';
import './domain/repositories/weather_repository.dart';
import './domain/usecases/get_current_weather.dart';
import './domain/usecases/get_forecast_weather.dart';
import './presentation/bloc/current_weather/current_weather_bloc.dart';
import './presentation/bloc/forecast_weather/forecast_weather_bloc.dart';

final locator = GetIt.instance;

void initLocator() {
  // bloc
  locator.registerFactory(() => CurrentWeatherBloc(locator()));

    locator.registerFactory(() => ForecastWeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeather(locator()));

  locator.registerLazySingleton(() => GetForecastWeather(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton(() => http.Client());
}

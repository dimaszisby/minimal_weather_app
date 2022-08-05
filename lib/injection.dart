import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:minimal_weather_app/presentation/bloc/current_weather/current_weather_state.dart';

import 'data/datasources/remote_data_source.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/get_current_weather.dart';
import 'presentation/bloc/current_weather/current_weather_bloc.dart';

final locator = GetIt.instance;

void initLocator() {

  // bloc
  locator.registerFactory(() => CurrentWeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeather(locator()));

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

  //for debugging to be deleted
  locator.registerLazySingleton(() => WeatherHasData(locator()));
}
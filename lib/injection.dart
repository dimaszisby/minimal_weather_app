import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/remote_data_source.dart';

final locator = GetIt.instance;

void initLocator() {
  
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton(() => http.Client());
}

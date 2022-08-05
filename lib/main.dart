import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:minimal_weather_app/injection.dart';
import 'package:minimal_weather_app/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:minimal_weather_app/presentation/ui/pages/page_current_weather.dart';

import 'injection.dart' as di;

void main() {
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<CurrentWeatherBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const CurrentWeatherPage(),
      ),
    );
  }
}

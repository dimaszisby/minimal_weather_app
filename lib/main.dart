import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_weather_app/presentation/bloc/forecast_weather/forecast_weather_bloc.dart';
import 'package:minimal_weather_app/presentation/ui/molecules/card_forecast.dart';
import 'package:minimal_weather_app/presentation/ui/pages/test_page_forecast_weather.dart';
import 'injection.dart' as di;

import './injection.dart';
import './presentation/bloc/current_weather/current_weather_bloc.dart';
import './presentation/ui/pages/page_current_weather.dart';

void main() {
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return MultiBlocProvider(
  //     providers: [
  //       BlocProvider(
  //         create: (_) => di.locator<CurrentWeatherBloc>(),
  //       ),
  //     ],
  //     child: MaterialApp(
  //       title: 'Flutter Demo',
  //       theme: ThemeData(
  //         primarySwatch: Colors.orange,
  //       ),
  //       home: const CurrentWeatherPage(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<ForecastWeatherBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const ForecastCard(),
      ),
    );
  }
}

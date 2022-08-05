import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_weather_app/domain/usecases/get_current_weather.dart';

import '../../../injection.dart';
import '../../bloc/current_weather/current_weather_event.dart';
import '/presentation/bloc/current_weather/current_weather_bloc.dart';
import '/presentation/bloc/current_weather/current_weather_state.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {

  final _bloc = locator<CurrentWeatherBloc>();
  final _useCase = locator<GetCurrentWeather>();
  final tLon = 106.8456;
  final tLat = 6.2088;
  @override
  void initState() {
    super.initState();
    _useCase.repository.getCurrentWeather(tLon, tLat);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherHasData) {
            return Column(
              key: const Key('weather_Data'),
              children: [
                Text(state.result.lon as String),
                Text(state.result.lat as String),
                Text(state.result.main),
                Text(state.result.temperature as String),
                Text(state.result.maxTemperature as String),
                Text(state.result.minTemperature as String),
                Text(state.result.pressure as String),
                Text(state.result.humidity as String),
                Text(state.result.cloud),
                Text(state.result.winSpeed as String),
                Text(state.result.visibility as String),
              ],
            );
          } else if (state is WeatherError) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          } else {
            return const Center(
              child: Text('Initial State'),
            );
          }
        },
      ),
    );
  }
}

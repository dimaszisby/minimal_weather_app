import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:minimal_weather_app/domain/usecases/get_current_weather.dart';
import 'package:minimal_weather_app/presentation/bloc/current_weather/current_weather_event.dart';
import '../../../injection.dart';
import '/presentation/bloc/current_weather/current_weather_bloc.dart';
import '/presentation/bloc/current_weather/current_weather_state.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  
  final tLon = 106.8456;
  final tLat = 6.2088;
  @override
  void initState() {
    super.initState();
    context
        .read<CurrentWeatherBloc>()
        .add(OnCoordinateChanged(lon: tLon, lat: tLat));
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
                Text('${state.result.lon}'),
                Text('${state.result.lat}'),
                Text(state.result.main),
                Text('${state.result.temperature}'),
                Text('${state.result.maxTemperature}'),
                Text('${state.result.minTemperature}'),
                Text('${state.result.pressure}'),
                Text('${state.result.humidity}'),
                Text(state.result.cloud),
                Text('${state.result.winSpeed}'),
                Text('${state.result.visibility}'),
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

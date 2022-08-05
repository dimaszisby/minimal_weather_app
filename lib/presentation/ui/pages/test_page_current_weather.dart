import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/current_weather/current_weather_bloc.dart';
import '../../bloc/current_weather/current_weather_event.dart';
import '../../bloc/current_weather/current_weather_state.dart';

class TestWeatherPage extends StatelessWidget {
  final lonController = TextEditingController();
  final latController = TextEditingController();

  late double lon = 6.2088;
  late double lat = 106.8456;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Weather',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherHasData) {
            return Column(
              key: Key('weather_data'),
              children: [
                Column(
                  children: [
                    Text(state.result.temperature as String),
                  ],
                ),
              ],
            );
          } else if (state is WeatherError) {
            return Center(
              child: Text('Something went wrong!'),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

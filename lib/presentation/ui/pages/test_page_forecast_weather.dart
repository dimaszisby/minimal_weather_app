import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/retry.dart';
import 'package:minimal_weather_app/presentation/bloc/forecast_weather/forecast_weather_bloc.dart';
import 'package:minimal_weather_app/presentation/bloc/forecast_weather/forecast_weather_event.dart';

import '../../bloc/forecast_weather/forecast_weather_state.dart';

class TestForecastWeatherPage extends StatefulWidget {
  const TestForecastWeatherPage({Key? key}) : super(key: key);

  @override
  State<TestForecastWeatherPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TestForecastWeatherPage> {

  final tLon = 106.8456; //TODO: Change with GeoLocator and GeoCoder
  final tLat = 6.2088;

  @override
  void initState() {
    super.initState();
    context
        .read<ForecastWeatherBloc>()
        .add(OnTimeStampChanged(lon: tLon, lat: tLat));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<ForecastWeatherBloc, ForecastWeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WeatherHasData) {
                
                return Flexible(
                  child: ListView.builder(
                    itemCount: state.result.length,
                    itemBuilder: (context, index) {
                      // var forecastitem = state.result;
                      return Text(state.result[index].dateTime);
                    },
                  ),
                );
              } else if (state is WeatherError) {
                return const Center(
                  child: Text('Something went wrong!'),
                );
              } else {
                return const Center(child: Text('Null'));
              }
            },
          ),
        ],
      ),
    );
  }
}

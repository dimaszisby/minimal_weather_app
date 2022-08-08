import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../bloc/current_weather/current_weather_bloc.dart';
import '../../bloc/current_weather/current_weather_state.dart';
import '../../bloc/current_weather/current_weather_event.dart';
import '../molecules/card_coordinate.dart';
import '../molecules/card_middle.dart';
import '../molecules/segment_header.dart';
import '../molecules/segment_middle_info.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final tLon = 106.8456; //TODO: Change with GeoLocator and GeoCoder
  final tLat = 6.2088;
  @override
  void initState() {
    super.initState();
    context
        .read<CurrentWeatherBloc>()
        .add(OnCoordinateChanged(lon: tLon, lat: tLat));
  }

  void initCurrentLocation() {
    //get the current location from bloc
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor("#1A1A1A"),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ), //hardcoded for now
            BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is WeatherHasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    key: const Key('weather_Data'),
                    children: [
                      const HeaderSegment(
                          country:
                              'Indonesia'), //TODO: Replaced with GeoLocator and GeoCoding
                      CoordinateCard(
                        lon: '${state.result.lon}',
                        lat: '${state.result.lat}',
                      ),
                      MiddleInfoSegment(
                        main: state.result.main,
                        temperature: '${state.result.temperature}',
                        mintemp: '${state.result.minTemperature}',
                        maxTemp: '${state.result.maxTemperature}',
                        pressure: '${state.result.pressure}',
                        humidity: '${state.result.humidity}',
                        iconCode: state.result.iconCode,
                      ),
                      MiddleInfoCard(
                        windSpeed: "${state.result.cloud}",
                        cloud: '${state.result.winSpeed}',
                        visibility: '${state.result.visibility}',
                      ),
                      // ForecastCard(),
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
          ],
        ),
      ),
    );
  }
}

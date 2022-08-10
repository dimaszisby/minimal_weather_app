import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../injection.dart';
import '../../../domain/usecases/get_current_location.dart';
import '../../bloc/current_weather/current_weather_bloc.dart';
import '../../bloc/current_weather/current_weather_state.dart';
import '../../bloc/current_weather/current_weather_event.dart';
import '../molecules/card_coordinate.dart';
import '../molecules/card_middle.dart';
import '../molecules/segment_header.dart';
import '../molecules/segment_middle_info.dart';

class CurrentWeatherView extends StatefulWidget {
  const CurrentWeatherView({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherView> createState() => _CurrentWeatherViewState();
}

class _CurrentWeatherViewState extends State<CurrentWeatherView> {
  final loc = locator<GetLocation>();

  double tLon = 48.8566;
  double tLat = 2.3522;
  late String tCountry = 'Getting Data';

  @override
  void initState() {
    super.initState();
    initCurrentLocaton();
    context
        .read<CurrentWeatherBloc>()
        .add(OnCoordinateChanged(lon: tLon, lat: tLat));
    Timer(Duration(seconds: 2), () {
      tCountry = loc.country;
      print('AFTER TIMER : ${tCountry}');
      setState(() {
        
      });
    });
    
    
  }

  initCurrentLocaton() async {
    Position position = await loc.getGeoLocationPosition();
    tLon = position.longitude;
    tLat = position.latitude;

    setState(() {
      
    });
    loc.getAddressFromLatLong(position);
    // print("[VIEW] Country is: $tCountry");
    setState(() {
    });
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
                      HeaderSegment(country: tCountry),
                      CoordinateCard(
                        lon: '$tLon',
                        lat: '$tLat',
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

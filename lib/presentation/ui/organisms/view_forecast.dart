import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../../../location_services.dart';
import '../../../injection.dart';
import '../../bloc/forecast_weather/forecast_weather_event.dart';
import '../../bloc/forecast_weather/forecast_weather_bloc.dart';
import '../../bloc/forecast_weather/forecast_weather_state.dart';
import '../molecules/card_forecast_Item.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({Key? key}) : super(key: key);

  @override
  State<ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<ForecastView> {
  
  final loc = locator<LocationServices>();

  num tLon = 106.8456;
  num tLat = 6.2088;

  @override
  void initState() {
    super.initState();
    context
        .read<ForecastWeatherBloc>()
        .add(OnTimeStampChanged(lon: tLon, lat: tLat));
  }

  initCurrentLocaton() async {
    Position position = await loc.getGeoLocationPosition();
    tLon = position.longitude;
    tLat = position.latitude;

    loc.getAddressFromLatLong(position);

    Timer(const Duration(milliseconds: 1250), () {
      var tCountry = loc.country;
      setState(() {});
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastWeatherBloc, ForecastWeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherHasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                var date = state.result[index].dateTime;
                var fomattedDate = DateTime.tryParse(date);
                return ForecastItemCard(
                  day: DateFormat.E().format(fomattedDate!),
                  hour: DateFormat.jm().format(fomattedDate),
                  main: state.result[index].main,
                  icon: state.result[index].iconCode,
                  temp: '${state.result[index].temperature}',
                  winSpeed: '${state.result[index].winSpeed}',
                );
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
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:minimal_weather_app/presentation/ui/organisms/view_forecast.dart';
import 'package:minimal_weather_app/presentation/ui/organisms/view_current_weather.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _initFabHeight = 120.0;

  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed =  100;

  final tLon = 106.8456; //TODO: Change with GeoLocator and GeoCoder
  final tLat = 6.2088;
  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    _panelHeightClosed = MediaQuery.of(context).size.height * 0.25;

    return Material(
      child: Stack(
        children: [
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(
              () {
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                    _initFabHeight;
              },
            ),
          ),

          // the fab
          // Positioned(
          //   right: 20.0,
          //   bottom: _fabHeight,
          //   child: FloatingActionButton(
          //     child: Icon(
          //       Icons.gps_fixed,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //     onPressed: () {},
          //     backgroundColor: Colors.white,
          //   ),
          // ),

          Positioned(
            top: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).padding.top,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),

          //the SlidingUpPanel Title
          // Positioned(
          //   top: 52.0,
          //   child: Container(
          //     padding: const EdgeInsets.fromLTRB(24.0, 18.0, 24.0, 18.0),
          //     child: Text(
          //       "SlidingUpPanel Example",
          //       style: TextStyle(fontWeight: FontWeight.w500),
          //     ),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(24.0),
          //       boxShadow: [
          //         BoxShadow(
          //             color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16.0)
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          padding: const EdgeInsets.only(top: 10),
          controller: sc,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              // color: Colors.amber,
              child: const Text(
                'Forecast',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const ForecastView(),
          ],
        ));
  }

  Widget _body() {
    return const CurrentWeatherView();
  }
}

import 'package:flutter/material.dart';

import '../../../data/constants.dart';

class ForecastItemCard extends StatelessWidget {
  const ForecastItemCard({
    Key? key,
    required this.day,
    required this.hour,
    required this.main,
    required this.icon,
    required this.temp,
    required this.winSpeed,
  }) : super(key: key);

  final String day;
  final String hour;
  final String main;
  final String icon;
  final String temp;
  final String winSpeed;

  @override
  Widget build(BuildContext context) {
    final leftSegment = Row(
      //Left SEGMENT
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          //LEFT CONTAINER
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$day, ',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                hour,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Container(
          //MIDDLE CONTAINER
          width: MediaQuery.of(context).size.width * 0.275,
          padding: const EdgeInsets.only(right: 10, left: 5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  image: DecorationImage(
                    image: NetworkImage(
                      Urls.weatherIcon(icon),
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Text(
                main,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final rightSegment = SizedBox(
      //RIGHT SEGMENT
      // width: MediaQuery.of(context).size.width * 0.1,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                temp,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const Text(
                ' °C',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                winSpeed,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const Text(
                ' K/mh',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.black.withAlpha(200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftSegment,
          rightSegment,
        ],
      ),
    );
  }
}

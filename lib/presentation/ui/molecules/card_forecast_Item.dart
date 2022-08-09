import 'package:flutter/material.dart';

import '../../../data/constants.dart';

class ForecastItemCard extends StatelessWidget {
  const ForecastItemCard({
    Key? key,
    required this.dateTime,
    required this.main,
    required this.icon,
    required this.temp,
    required this.winSpeed,
  }) : super(key: key);

  final String dateTime;
  final String main;
  final String icon;
  final String temp;
  final String winSpeed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Row(children: [
        Text(dateTime),
        Row(
          children: [
            // Image(
            //   image: NetworkImage(
            //     Urls.weatherIcon(icon),
            //   ),
            // ),
            Text(main),
          ],
        ),
        Row(
          children: [
            Text(temp),
            Text(winSpeed),
          ],
        )
      ]),
    );
  }
}

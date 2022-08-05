import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.31,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
    );
  }
}

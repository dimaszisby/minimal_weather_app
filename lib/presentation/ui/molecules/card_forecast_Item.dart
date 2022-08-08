import 'package:flutter/material.dart';

class ForecastItemCard extends StatelessWidget {
  const ForecastItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
    );
  }
}

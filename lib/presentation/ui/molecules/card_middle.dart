import 'package:flutter/material.dart';

class MiddleInfoCard extends StatelessWidget {
  const MiddleInfoCard(
      {Key? key,
      required this.windSpeed,
      required this.cloud,
      required this.visibility})
      : super(key: key);

  final String windSpeed;
  final String cloud;
  final String visibility;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.07,
      margin: const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 20),
      padding: const EdgeInsets.only(left: 5, top: 15, right: 5, bottom: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'Wind Speed',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    child: Text(
                      '${double.parse(cloud).toStringAsFixed(0)} Km/h',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'Cloud',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    '${windSpeed}%',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'Visibility',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    visibility,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

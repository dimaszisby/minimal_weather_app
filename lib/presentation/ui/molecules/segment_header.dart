import 'package:flutter/material.dart';

class HeaderSegment extends StatelessWidget {
  const HeaderSegment({Key? key, required this.country}) : super(key: key);

  final String country;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/menu_button.png')),
        Column(
          children: [
            const Text(
              'Today',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              country,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/search_button.png')),
      ],
    );
  }
}

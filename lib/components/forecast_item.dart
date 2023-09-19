import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  final String day;
  final String icon;
  final String temp;

  const ForecastItem({
    super.key,
    required this.day,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day),
        Image.network(
          'http:$icon',
          width: 50,
          height: 50,
        ),
        Text(temp),
      ],
    );
  }
}

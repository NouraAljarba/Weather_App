import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 300,
      width: 380,
      child: Card(
        color: theme.brightness == Brightness.dark
            ? Colors.blue[800]
            : Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Weather in ${weather.location!.name}",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor),
              ),
              Hero(
                tag: "weatherIcon",
                child: Image.network(
                  "http:${weather.current!.condition!.icon}",
                  width: 150,
                  height: 100,
                ),
              ),
              Text(
                "${weather.current!.tempC}°C",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor),
              ),
              Text(
                "${weather.current!.condition!.text}",
                style: TextStyle(fontSize: 20, color: theme.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

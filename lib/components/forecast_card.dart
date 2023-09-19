import 'package:flutter/material.dart';
import '../models/forecast.dart';
import '../services/api_services.dart';
import 'forecast_item.dart';

class ForecastCard extends StatefulWidget {
  final String city;

  const ForecastCard({Key? key, required this.city}) : super(key: key);

  @override
  createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  late Future<List<Forecast>> forecast;

  @override
  void initState() {
    super.initState();
    forecast = WeatherService().getForecast(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 250,
      child: FutureBuilder<List<Forecast>>(
        future: forecast,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text("No forecast data available.");
          } else {
            return Card(
              color: theme.brightness == Brightness.dark
                  ? Colors.blue[800]
                  : Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "3-Day Forecast for ${widget.city}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: snapshot.data!.map((forecastItem) {
                        return ForecastItem(
                          day: forecastItem.day,
                          icon: forecastItem.iconUrl,
                          temp: forecastItem.temperature,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

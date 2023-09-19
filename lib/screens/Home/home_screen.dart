import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_project/components/app_bar.dart';
import '../../components/forecast_card.dart';
import '../../components/home_weather_card.dart';
import '../../models/weather.dart';
import '../../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchWeather("Riyadh");
  }

  _fetchWeather(String city) async {
    setState(() {
      _isLoading = true;
    });
    try {
      Weather weather = await _weatherService.getWeather(city);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (kDebugMode) {
        print("Error fetching weather: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: "Weather App"),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _weather != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(child: WeatherCard(weather: _weather!)),
                      const SizedBox(height: 20),
                      const Expanded(child: ForecastCard(city: "Riyadh")),
                    ],
                  ),
                )
              : const Center(child: Text("Failed to fetch weather data.")),
    );
  }
}

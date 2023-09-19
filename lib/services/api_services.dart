import 'dart:convert';
import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../models/forecast.dart';
import '../models/weather.dart';

class WeatherService {
  Future<Weather> getWeather(String city) async {
    final response = await http.get(
      Uri.parse(
          'http://api.weatherapi.com/v1/current.json?key=6bf56db16e4b41e69a175756233108&q=$city'),
    );

    final responseAsJson = json.decode(response.body);

    final result = Weather.fromJson(responseAsJson);

    return result;
  }

  Future<List<Forecast>> getForecast(String city) async {
    final response = await http.get(
      Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=6bf56db16e4b41e69a175756233108&q=$city&days=3'),
    );
    final responseAsJson = json.decode(response.body);
    final forecastList = responseAsJson['forecast']['forecastday'] as List;
    return forecastList.map((data) => Forecast.fromJson(data)).toList();
  }
}

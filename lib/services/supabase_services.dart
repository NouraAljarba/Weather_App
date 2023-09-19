import 'package:flutter_weather_project/models/city.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

supabaseConfig() async {
  await Supabase.initialize(
      url: 'https://zdbvyogunexwxipjxsgb.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpkYnZ5b2d1bmV4d3hpcGp4c2diIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM0Njg2NzEsImV4cCI6MjAwOTA0NDY3MX0.U2_ThIKSSjq8DT5tDnoTtonVzKxxNRiTWZtnUihhFUE');
}

Future<List<City>> getCities() async {
  final rawCities = await supabase.from('city').select('city_id,city');
  final List<City> cities = [];
  for (var element in rawCities) {
    cities.add(City.fromJson(element));
  }
  return cities;
}

class WeatherDatabaseService {
  Future<List<City>> getCitiesMatchingQuery(String query) async {
    final rawCities = await supabase
        .from('city')
        .select('city_id,city')
        .ilike('city', '%$query%');
    final List<City> cities = [];
    for (var element in rawCities) {
      cities.add(City.fromJson(element));
    }
    return cities;
  }
}

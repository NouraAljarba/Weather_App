class Forecast {
  final String day;
  final String iconUrl;
  final String temperature;

  Forecast({required this.day, required this.iconUrl, required this.temperature});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      day: json['date'],
      iconUrl: json['day']['condition']['icon'],
      temperature: "${json['day']['avgtemp_c']}°C",
    );
  }
}

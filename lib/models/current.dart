
import 'condition.dart';

class Current {
  String? lastUpdated;
  num? tempC;
  num? tempF;
  int? isDay;
  Condition? condition;
  double? windKph;
  num? windDegree;
  num? humidity;
  num? cloud;

  Current(
      {this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windKph,
      this.windDegree,
      this.humidity,
      this.cloud});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    humidity = json['humidity'];
    cloud = json['cloud'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['last_updated'] = lastUpdated;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    return data;
  }
}


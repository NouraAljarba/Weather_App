class City {
  int? cityId;
  String? city;

  City({this.cityId, this.city});

  City.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['city'] = city;
    return data;
  }
}

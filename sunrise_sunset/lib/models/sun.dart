class SunriseSunsetTimes {
  Results? results;
  String? status;

  SunriseSunsetTimes({this.results, this.status});

  SunriseSunsetTimes.fromJson(Map<String, dynamic> json) {
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Results {
  String? sunrise;
  String? sunset;
  String? solarNoon;
  int? dayLength;

  Results({
    this.sunrise,
    this.sunset,
    this.solarNoon,
    this.dayLength,
  });

  Results.fromJson(Map<String, dynamic> json) {
    sunrise = json['results']['sunrise'];
    sunset = json['results']['sunset'];
    solarNoon = json['results']['solar_noon'];
    dayLength = json['results']['day_length'];

    print(json['results'].runtimeType);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['solar_noon'] = this.solarNoon;
    data['day_length'] = this.dayLength;

    return data;
  }
}

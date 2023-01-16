import 'dart:convert';

import 'package:weatherapp_starter_project/model/weather_data.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/model/weather_data_daily.dart';
import 'package:weatherapp_starter_project/model/weather_data_hourly.dart';
import 'package:weatherapp_starter_project/utils/api_url.dart';

class FetchWeatherApi {
  WeatherData? weatherData;

  //traitement de la reponse -> toJson

  Future<WeatherData?> processData(lat, long) async {
    var reponse = await http.get(Uri.parse(apiURL(lat, long)));
    var jsonString = jsonDecode(reponse.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));
    return weatherData!;
  }
}

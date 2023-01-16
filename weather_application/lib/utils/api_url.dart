import 'package:weatherapp_starter_project/api/api_key.dart';

String apiURL(var lat, var long) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&exclude={part}&appid=$apiKey&units=metric&lang=fr";
  return url;
}

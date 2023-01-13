import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart' hide LocationAccuracy;
import 'package:sunrise_sunset/models/sun.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' hide Location;

class SunriseSunsetService {
  var location = Location();
  late Position position;
  Future<Results> getTimesData() async {
    // Récupération de la localisation actuelle de l'utilisateur
    var geoloc = await location.getLocation();

    // Construction de l'URL a appeler
    const url = 'api.sunrise-sunset.org';
    // Appel

    final path = "/json";
    final response = await http.get(Uri.https(url, path, {
      "lat": {geoloc.latitude.toString()},
      "lng": {geoloc.longitude.toString()},
      "formatted": "0"
    }));

    if (response.statusCode == 200) {
      return Results.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error");
    }
  }

  getAddress() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var longitude = position.longitude;
    var latitude = position.latitude;

    print(latitude);
    print(longitude);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      return placemarks;
    } on Exception catch (e) {
      print("error");
      ;
    }
  }
}

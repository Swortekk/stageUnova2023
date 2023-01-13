import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sunrise_sunset/models/sun.dart';
import 'package:sunrise_sunset/services/location_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SunriseSunsetService sunriseSunsetService = SunriseSunsetService();
  Results sunriseSunsetTimes = Results();

  String? currentSunrise;
  String? currentSunset;
  String? city;
  Placemark? place;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    sunriseSunsetTimes = await sunriseSunsetService.getTimesData();
    var placemarks = await sunriseSunsetService.getAddress();
    setState(() {
      currentSunrise = sunriseSunsetTimes.sunrise;
      currentSunset = sunriseSunsetTimes.sunset;
      place = placemarks[0];
      city = "${place!.locality}, ${place!.postalCode}, ${place!.country}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TEST")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Vous êtes à $city "),
            Text(
                "Lever de soleil : ${currentSunrise.toString().substring(11, 16)}"),
            Text(
                "Coucher de soleil : ${currentSunset.toString().substring(11, 16)}"),
          ],
        ),
      ),
    );
  }
}

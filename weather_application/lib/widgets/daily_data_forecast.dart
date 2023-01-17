import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/model/weather_data_daily.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({super.key, required this.weatherDataDaily});

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);

    final x = DateFormat('EEE').format(time);

    return x;
  }

  String toFrench(String? jour, String? mois) {
    String dayTranslate = "";
    var jours = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    var joursFr = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];

    for (int i = 0; i < jours.length; i++) {
      if (jours[i] == jour) {
        jours[i] = joursFr[i];
        dayTranslate = joursFr[i];
      }
    }
    return dayTranslate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "Prochains jours",
              style: TextStyle(
                color: CustomColors.textColorBlack,
                fontSize: 17,
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      toFrench(getDay(weatherDataDaily.daily[index].dt), null),
                      style: const TextStyle(
                        color: CustomColors.textColorBlack,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                          "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                    ),
                    Text("${weatherDataDaily.daily[index].temp!.min}" +
                        "° / ${weatherDataDaily.daily[index].temp!.max}°")
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

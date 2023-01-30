import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/logic/http_client.dart';
import 'package:weather_app/models/predict.dart';

class WeeklyListView extends StatelessWidget {
  final int realDay;
  final DateTime currentDate = DateTime.now();
  final HTTPClient _httpClient = HTTPClient();
  final String lat;
  final String lon;

  WeeklyListView({
    Key? key,
    required this.realDay,
    required this.lat,
    required this.lon,
  }) : super(key: key);

  String parseDateofWeekToShort(String dayOfWeek) {
    switch (dayOfWeek) {
      case "Monday":
        return "MON";
      case "Tuesday":
        return "TUE";
      case "Wednesday":
        return "WED";
      case "Thursday":
        return "THU";
      case "Friday":
        return "FRI";
      case "Sunday":
        return "SUN";
      case "Saturday":
        return "SAT";
      default:
        return "MON";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _httpClient.getPredictWeather(lat, lon),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Predict? predict = snapshot.data;
          return ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFFE562E6),
                      Color(0xFF5064F0),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      parseDateofWeekToShort(DateFormat('EEEE')
                          .format(currentDate.add(const Duration(days: 1)))),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('d MMM')
                          .format(currentDate.add(const Duration(days: 1))),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                      child: Image.network(
                        "http://openweathermap.org/img/wn/${predict?.list[0].weather[0].icon}@2x.png",
                      ),
                    ),
                    Text(
                      '${predict?.list[0].temp.day.floor()} °C',
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[0].rain} mm',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[0].pressure} hPa',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFFE562E6),
                      Color(0xFF5064F0),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      parseDateofWeekToShort(DateFormat('EEEE')
                          .format(currentDate.add(const Duration(days: 2)))),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('d MMM')
                          .format(currentDate.add(const Duration(days: 2))),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                      child: Image.network(
                        "http://openweathermap.org/img/wn/${predict?.list[1].weather[0].icon}@2x.png",
                      ),
                    ),
                    Text(
                      '${predict?.list[1].temp.day.floor()} °C',
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[1].rain} mm',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[1].pressure} hPa',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                width: 70,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFFE562E6),
                      Color(0xFF5064F0),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      parseDateofWeekToShort(DateFormat('EEEE')
                          .format(currentDate.add(const Duration(days: 3)))),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('d MMM')
                          .format(currentDate.add(const Duration(days: 3))),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                      child: Image.network(
                        "http://openweathermap.org/img/wn/${predict?.list[2].weather[0].icon}@2x.png",
                      ),
                    ),
                    Text(
                      '${predict?.list[2].temp.day.floor()} °C',
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[2].rain} mm',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[2].pressure} hPa',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFFE562E6),
                      Color(0xFF5064F0),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      parseDateofWeekToShort(DateFormat('EEEE')
                          .format(currentDate.add(const Duration(days: 4)))),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateFormat('d MMM')
                          .format(currentDate.add(const Duration(days: 4))),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                      child: Image.network(
                        "http://openweathermap.org/img/wn/${predict?.list[3].weather[0].icon}@2x.png",
                      ),
                    ),
                    Text(
                      '${predict?.list[3].temp.day.floor()} °C',
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[3].rain} mm',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[3].pressure} hPa',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFFE562E6),
                      Color(0xFF5064F0),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      parseDateofWeekToShort(DateFormat('EEEE')
                          .format(currentDate.add(const Duration(days: 5)))),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('d MMM')
                          .format(currentDate.add(const Duration(days: 5))),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                      child: Image.network(
                        "http://openweathermap.org/img/wn/${predict?.list[4].weather[0].icon}@2x.png",
                      ),
                    ),
                    Text(
                      '${predict?.list[4].temp.day.floor()} °C',
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[4].rain} mm',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[4].pressure} hPa',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFFE562E6),
                      Color(0xFF5064F0),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      parseDateofWeekToShort(DateFormat('EEEE')
                          .format(currentDate.add(const Duration(days: 6)))),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('d MMM')
                          .format(currentDate.add(const Duration(days: 6))),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                      child: Image.network(
                        "http://openweathermap.org/img/wn/${predict?.list[5].weather[0].icon}@2x.png",
                      ),
                    ),
                    Text(
                      '${predict?.list[5].temp.day.floor()} °C',
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[5].rain} mm',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[5].pressure} hPa',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFFE562E6),
                      Color(0xFF5064F0),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      parseDateofWeekToShort(DateFormat('EEEE')
                          .format(currentDate.add(const Duration(days: 7)))),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('d MMM')
                          .format(currentDate.add(const Duration(days: 7))),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                      child: Image.network(
                        "http://openweathermap.org/img/wn/${predict?.list[6].weather[0].icon}@2x.png",
                      ),
                    ),
                    Text(
                      '${predict?.list[6].temp.day.floor()} °C',
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[6].rain ?? 0} mm',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${predict?.list[6].pressure} hPa',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return const Text("Loading...");
      },
    );
  }
}

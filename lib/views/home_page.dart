import 'package:weather_app/logic/http_Client.dart';
import 'package:weather_app/models/weather_Info.dart';
import 'package:weather_app/widgets/card_with_gradient.dart';
import 'package:weather_app/widgets/weekly_listview.dart';
import 'package:weather_app/widgets/white_button.dart';
import 'package:weather_app/widgets/white_card.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:developer' as developer;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HTTPClient _client = HTTPClient();
  late DateTime date = DateTime.now();
  late String dayText;
  late int dateDay;
  late String dateMonth;
  Position? _position;
  String? lat;
  String? lon;

  @override
  void initState() {
    super.initState();
    dayText = DateFormat('EEEE').format(date);
    dateDay = date.day;
    dateMonth = DateFormat('MMMM').format(date);
    getPosition();
  }

  void getPosition() async {
    Position tempPosition = await _getCurrentPossition();
    setState(() {
      _position = tempPosition;
      lat = _position?.latitude.toString();
      lon = _position?.longitude.toString();
      developer.log(_position.toString());
    });
  }

  Future<Position> _getCurrentPossition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      const AlertDialog(
        title: Text("GPS is disabled"),
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        const AlertDialog(
          title: Text("Location permissions are denied"),
        );
        return Future.error("Location permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      const AlertDialog(
        title: Text(
            "Location permissions are pernamently denide, operation failed"),
      );
      return Future.error(
          "Location permissions are pernamently denide, operation failed");
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color(0xFFFAF0FB),
              Color(0xFFF2EAF4),
            ],
          ),
        ),
        child: Column(
          children: [
            FutureBuilder(
                future: _client.getCurrentWeather("52.19", "21.17"),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    WeatherInfo? weatherInfo = snapshot.data;

                    return Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const WhiteButton(
                              icon: Icons.tune,
                              color: Colors.black,
                            ),
                            Column(children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 17,
                                    height: 15,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        Icons.location_on,
                                        color: Color(0xFF6764E7),
                                        size: 17,
                                      ),
                                      onPressed: () {
                                        _getCurrentPossition().then((value) {
                                          lat = "${value.latitude}";
                                          lon = "${value.longitude}";
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    "${weatherInfo?.name}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  children: const [
                                    CardWithGradient(
                                      // padding: EdgeInsets.only(left: 7),
                                      padding: EdgeInsets.zero,
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      width: 52,
                                      beginAlignment: Alignment.topLeft,
                                      endAlignment: Alignment.topLeft,
                                      child: Text(
                                        "Updating *",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]),
                            const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('lib/images/avatar.png'),
                            ),
                          ],
                        ),
                        CardWithGradient(
                          margin: const EdgeInsets.all(18),
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          beginAlignment: Alignment.topLeft,
                          endAlignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Placeholder(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${weatherInfo?.weather?[0]?.description}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "$dayText, $dateDay $dateMonth",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${weatherInfo?.main?.temp?.floor()}°",
                                    style: const TextStyle(
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Fells like ${weatherInfo?.main?.feelsLike?.floor()}°',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.air,
                                    size: 60,
                                    color: Colors.white.withOpacity(0.4),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        WhiteCard(
                          windSpeed: weatherInfo?.wind?.speed,
                          pressure: weatherInfo?.main?.pressure,
                          clouds: weatherInfo?.clouds?.cloudsAll,
                          humidity: weatherInfo?.main?.humidity,
                          visibility: weatherInfo?.visibility,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Weekly forecast',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              TextButton(
                                onPressed: null,
                                child: Text(
                                  'Next Month  >',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 162, 30, 206)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 140,
                          child: WeeklyListView(realDay: 0),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    const AlertDialog(
                      title: Text("Error"),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }))
          ],
        ),
      ),
    );
  }
}

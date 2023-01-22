import 'package:weather_app/logic/geolocatization.dart';
import 'package:weather_app/logic/http_Client.dart';
import 'package:weather_app/models/weather_Info.dart';
import 'package:weather_app/widgets/card_with_gradient.dart';
import 'package:weather_app/widgets/weekly_listview.dart';
import 'package:weather_app/widgets/white_button.dart';
import 'package:weather_app/widgets/white_card.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HTTPClient _client = HTTPClient();
  final Geolocalization _geolocalization = Geolocalization();
  final DateTime date = DateTime.now();
  late String dayText;
  late int dateDay;
  late String dateMonth;
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
    _geolocalization.getCurrentPossition().then((value) {
      setState(() {
        lat = "${value.latitude}";
        lon = "${value.longitude}";
      });
    });
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
                future: _client.getCurrentWeather(lat ?? "1", lon ?? "1"),
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
                                  const SizedBox(
                                    width: 17,
                                    height: 15,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        Icons.location_on,
                                        color: Color(0xFF6764E7),
                                        size: 17,
                                      ),
                                      onPressed: null,
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
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Image.network(
                                      "http://openweathermap.org/img/wn/${weatherInfo?.weather?[0]?.icon}@2x.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    "${weatherInfo?.weather?[0]?.description}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
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
                          sunrise: weatherInfo?.sys?.sunrise,
                          sunset: weatherInfo?.sys?.sunset,
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

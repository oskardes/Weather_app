import 'package:weather_app/view_models/http_client.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/views/maps.dart';
import 'package:weather_app/views/prediction.dart';
import 'package:weather_app/widgets/card_with_gradient.dart';
import 'package:weather_app/widgets/weekly_listview.dart';
import 'package:weather_app/widgets/white_card.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String lon;
  final String lat;
  bool loading = true;

  HomePage({super.key, required this.lon, required this.lat});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HTTPClient _client = HTTPClient();
  final DateTime date = DateTime.now();
  late String dayText;
  late int dateDay;
  late String dateMonth;

  @override
  void initState() {
    super.initState();
    dayText = DateFormat('EEEE').format(date);
    dateDay = date.day;
    dateMonth = DateFormat('MMMM').format(date);
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
                future: _client.getCurrentWeather(widget.lat, widget.lon),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    widget.loading = false;
                    WeatherInfo? weatherInfo = snapshot.data;
                    return Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
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
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ],
                        ),
                        CardWithGradient(
                          margin: const EdgeInsets.all(18),
                          padding: const EdgeInsets.all(18),
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
                                    width: 100,
                                    height: 95,
                                    child: Image.network(
                                      "http://openweathermap.org/img/wn/${weatherInfo?.weather?[0]?.icon}@2x.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    "${weatherInfo?.weather?[0]?.description}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
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
                                      fontSize: 12,
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
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Fells like ${weatherInfo?.main?.feelsLike?.floor()}°',
                                    style: const TextStyle(
                                      fontSize: 14,
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
                          lat: widget.lat,
                          lon: widget.lon,
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 140,
                          child: WeeklyListView(
                            realDay: 0,
                            lat: widget.lat,
                            lon: widget.lon,
                          ),
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
                })),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Maps(
                          lat: widget.lat,
                          lon: widget.lon,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF6264EF)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    "Go to maps",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Prediction()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF6264EF)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    "Prediction",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

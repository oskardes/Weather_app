import 'package:flutter/material.dart';
import 'package:weather_app/view_models/http_client.dart';
import 'package:weather_app/widgets/white_button.dart';

import 'package:intl/intl.dart';

class WhiteCard extends StatelessWidget {
  final int? pressure;
  final int? clouds;
  final double? windSpeed;
  final int? visibility;
  final int? humidity;
  final int? sunrise;
  final int? sunset;
  final String lat;
  final String lon;

  String convertDateTime(int utcTimestamp) {
    var tempTime = DateTime.fromMillisecondsSinceEpoch(utcTimestamp * 1000);
    return DateFormat.Hm().format(tempTime);
  }

  const WhiteCard({
    Key? key,
    required this.pressure,
    required this.clouds,
    required this.windSpeed,
    required this.humidity,
    required this.visibility,
    required this.sunrise,
    required this.sunset,
    required this.lat,
    required this.lon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(18, 10, 18, 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32), color: Colors.white),
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.cloud),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Air Quaility"),
                    ],
                  ),
                  Column(
                    children: const [
                      WhiteButton(
                        icon: Icons.refresh,
                        color: Colors.black,
                        fun: null,
                        radius: 15,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.compress),
                      const Text(
                        'Pressure',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '$pressure hPa',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.air),
                      const Text(
                        'Wind',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '$windSpeed m/h',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.cloud),
                      const Text(
                        'Cloudiness',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '$clouds%',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.water_drop_outlined),
                      const Text(
                        'Humidity ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '$humidity%',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.remove_red_eye),
                      const Text(
                        'Visibility',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '$visibility m',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.wb_sunny_outlined),
                          Text(
                            convertDateTime(sunrise ?? 0),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                        const Icon(Icons.mode_night_outlined),
                        Text(
                          convertDateTime(sunset ?? 0),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        )
      ],
    );
  }
}

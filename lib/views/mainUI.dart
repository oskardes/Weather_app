import 'package:flutter/material.dart';
import 'package:weather_app/views/home_page.dart';
import 'package:weather_app/views/maps.dart';
import 'package:weather_app/views/prediction.dart';

class MainUi extends StatelessWidget {
  final String lat;
  final String lon;

  MainUi({
    required this.lat,
    required this.lon,
    super.key,
  });

  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(controller: _pageController, children: [
      const Maps(),
      HomePage(),
      const Prediction(),
    ]);
  }
}

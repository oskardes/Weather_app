import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/views/home_page.dart';
import 'package:weather_app/views/maps.dart';
import 'package:weather_app/views/prediction.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            body: PageView(controller: _pageController, children: [
          const Maps(),
          HomePage(),
          const Prediction(),
        ])));
  }
}

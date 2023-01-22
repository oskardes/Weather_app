import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/views/home_page.dart';
import 'package:weather_app/views/maps.dart';
import 'package:weather_app/views/prediction.dart';
import 'package:weather_app/views/splashUI.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 1);

  Future<Position>? getLoc;

  @override
  void initState() {
    getLoc = _setCurretnLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            body: FutureBuilder(
          future: getLoc,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Position currentPosition = snapshot.data!;
              return PageView(controller: _pageController, children: [
                Maps(
                  lat: currentPosition.latitude,
                  lon: currentPosition.longitude,
                ),
                HomePage(
                  lat: currentPosition.latitude.toString(),
                  lon: currentPosition.longitude.toString(),
                ),
                const Prediction(),
              ]);
            } else {
              return const Center(
                child: Splash(),
              );
            }
          },
        )));
  }
}

Future<Position> _setCurretnLocation() async {
  Position location = await Geolocator.getCurrentPosition();
  return location;
}

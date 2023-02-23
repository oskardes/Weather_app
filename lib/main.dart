import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/view_controllers/geolocatization.dart';
import 'package:weather_app/views/home_page.dart';
import 'package:weather_app/views/splash_ui.dart';

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
  Future<Position>? getLoc;
  final Geolocalization _geolocalization = Geolocalization();

  @override
  void initState() {
    getLoc = _geolocalization.setCurretnLocation();
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
              return HomePage(
                lat: currentPosition.latitude.toString(),
                lon: currentPosition.longitude.toString(),
              );
            } else {
              return const Center(
                child: Splash(),
              );
            }
          },
        )));
  }
}

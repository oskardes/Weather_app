import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app/view_models/map_change.dart';
import 'package:weather_app/widgets/scale_bars/scale_bar_temp.dart';
import 'package:weather_app/widgets/white_button.dart';

class Maps extends StatefulWidget {
  final String lat;
  final String lon;

  const Maps({super.key, required this.lat, required this.lon});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final List<String> listOfTypeMap = <String>[
    "Temperature",
    "Precipitation",
    "Wind",
    "Humidity",
    "Pressure",
    "Cloudiness"
  ];

  final MapChange _mapChange = MapChange();

  late String dropDownValue = listOfTypeMap.first;
  String typeOfMap = "TA2";
  DateTime dateFromForecast = DateTime.now();
  String opacity = "0.8";
  Widget curretScaleBar = const ScaleBarTemp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(
                double.parse(widget.lat),
                double.parse(widget.lon),
              ),
              keepAlive: false,
              zoom: 7,
              maxZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/oskardes/cldf15ih7009x01oergvp3gg1/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoib3NrYXJkZXMiLCJhIjoiY2xkZjEyMDNiMGZqdTNwcGlyZ3Q2eTcxMCJ9.XLYa3nxHUctCHolj0sVgDw",
                additionalOptions: const {
                  "access_token":
                      "pk.eyJ1Ijoib3NrYXJkZXMiLCJhIjoiY2xkZjEyMDNiMGZqdTNwcGlyZ3Q2eTcxMCJ9.XLYa3nxHUctCHolj0sVgDw"
                },
                userAgentPackageName: 'com.oskardes.weatherApp',
              ),
              TileLayer(
                urlTemplate:
                    "http://maps.openweathermap.org/maps/2.0/weather/$typeOfMap/{z}/{x}/{y}?date=${dateFromForecast.millisecondsSinceEpoch ~/ 1000}&appid=*********************&opacity=$opacity",
                userAgentPackageName: 'com.oskardes.weatherApp',
                opacity: 0.6,
              ),
            ],
          ),
          Positioned(
            top: 20,
            left: 20,
            child: WhiteButton(
              color: Colors.black,
              fun: () {
                Navigator.pop(context);
              },
              icon: Icons.home,
              radius: 15,
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: DropdownButton(
              value: dropDownValue,
              items:
                  listOfTypeMap.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropDownValue = value!;
                  typeOfMap = _mapChange.checkTypeOfMap(value);
                  opacity = _mapChange.checkOpacityOfMap(value);
                  curretScaleBar = _mapChange.checkScaleBar(value);
                });
              },
              alignment: Alignment.centerRight,
            ),
          ),
          Positioned(
            bottom: 30,
            child: SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    left: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                      ),
                      onPressed: (() => setState(() {
                            dateFromForecast =
                                dateFromForecast.add(const Duration(hours: -3));
                          })),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Forecast Date:\n ${DateFormat('yyyy-MM-dd HH:mm').format(dateFromForecast.toLocal())}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                      ),
                      onPressed: (() => setState(() {
                            dateFromForecast =
                                dateFromForecast.add(const Duration(hours: 3));
                          })),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 45,
            child: Card(
              elevation: 4,
              color: Colors.white,
              child: Row(
                children: [
                  curretScaleBar,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/logic/forecast_tile_provider.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  GoogleMapController? _controller;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 4,
  );

  Set<TileOverlay> _tileOverlays = {};
  final List<String> listOfTypeMap = <String>[
    "Temperature",
    "Rain",
    "Snow",
    "Depth of snow",
    "Wind",
    "Humidity",
    "Pressure",
    "Cloudiness"
  ];
  String typeOfMap = "PR0";
  String nameOfMap = "Temperature";
  late String dropDownValue = listOfTypeMap.first;
  DateTime _dateFromForecast = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            gestureRecognizers: {
              Factory<PanGestureRecognizer>(() => PanGestureRecognizer()),
            },
            mapType: MapType.normal,
            initialCameraPosition: _initialPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              _initTiles(_dateFromForecast, typeOfMap);
            },
            tileOverlays: _tileOverlays,
          ),
          DropdownButton(
            value: dropDownValue,
            items: listOfTypeMap.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                dropDownValue = value!;
                typeOfMap = checkTypeOfMap(value);
                _initTiles(_dateFromForecast, typeOfMap);
              });
            },
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
                      onPressed: _controller == null
                          ? null
                          : () {
                              _actualizationDate(const Duration(hours: -3));
                            },
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
                            'Forecast Date:\n ${DateFormat('yyyy-MM-dd HH:mm').format(_dateFromForecast.toLocal())}',
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
                      onPressed: _controller == null
                          ? null
                          : () {
                              _actualizationDate(const Duration(hours: 3));
                            },
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
        ],
      ),
    );
  }

  _initTiles(DateTime date, typeOfMap) async {
    setState(() {
      final String overlayID = date.millisecondsSinceEpoch.toString();
      final TileOverlay tileOverlay = TileOverlay(
          tileOverlayId: TileOverlayId(overlayID),
          tileProvider: ForecastTileProvider(
            mapType: typeOfMap,
            opacity: 0.5,
            date: date,
          ));

      _tileOverlays = {tileOverlay};
    });
  }

  void _actualizationDate(Duration duration) {
    setState(() {
      _dateFromForecast = _dateFromForecast.add(duration);
      _initTiles(_dateFromForecast, typeOfMap);
    });
  }

  String checkTypeOfMap(String? valueFromDropDownList) {
    if (valueFromDropDownList == "Temperature") {
      return "TA2";
    } else if (valueFromDropDownList == "Rain") {
      return "PAR0";
    } else if (valueFromDropDownList == "Snow") {
      return "PAS0";
    } else if (valueFromDropDownList == "Depth of snow") {
      return "SD0";
    } else if (valueFromDropDownList == "Wind") {
      return "WS10";
    } else if (valueFromDropDownList == "Humidity") {
      return "HRD0";
    } else if (valueFromDropDownList == "Pressure") {
      return "APM";
    } else {
      return "CL";
    }
  }
}

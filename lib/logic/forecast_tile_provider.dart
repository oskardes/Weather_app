import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:weather_app/logic/cacheTiles.dart';

class ForecastTileProvider implements TileProvider {
  final String mapType;
  final double opacity;
  int tileSize = 256;
  final DateTime date;

  ForecastTileProvider({
    required this.mapType,
    required this.opacity,
    required this.date,
  });

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    Uint8List tileBytes = Uint8List(0);
    final currentDate = date.millisecondsSinceEpoch ~/ 1000;
    try {
      final url =
          "http://maps.openweathermap.org/maps/2.0/weather/$mapType/$zoom/$x/$y?date=$currentDate&opacity=$opacity&appid=f33c6d263c1af0b1db4d50d873b51e36";
      // if (CacheTiles.tiles.containsKey(url)) {
      //   tileBytes = CacheTiles.tiles[url]!;
      // }
      final uri = Uri.parse(url);
      final imageData = await NetworkAssetBundle(uri).load("");
      tileBytes = imageData.buffer.asUint8List();
      // CacheTiles.tiles[url] = tileBytes;
    } catch (e) {
      const AlertDialog(
        title: Text(
          "Error with download tiles",
        ),
      );
    }
    return Tile(tileSize, tileSize, tileBytes);
  }
}

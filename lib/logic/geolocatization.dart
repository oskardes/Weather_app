import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Geolocalization {
  Future<Position> getCurrentPossition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      const AlertDialog(
        title: Text("GPS is disabled"),
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        const AlertDialog(
          title: Text("Location permissions are denied"),
        );
        return Future.error("Location permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      const AlertDialog(
        title: Text(
            "Location permissions are pernamently denide, operation failed"),
      );
      return Future.error(
          "Location permissions are pernamently denide, operation failed");
    }

    return await Geolocator.getCurrentPosition();
  }
}

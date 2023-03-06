import 'package:flutter/material.dart';
import 'package:weather_app/widgets/scale_bars/scale_bar_clouds.dart';
import 'package:weather_app/widgets/scale_bars/scale_bar_humidity.dart';
import 'package:weather_app/widgets/scale_bars/scale_bar_precipitation.dart';
import 'package:weather_app/widgets/scale_bars/scale_bar_pressure.dart';
import 'package:weather_app/widgets/scale_bars/scale_bar_temp.dart';
import 'package:weather_app/widgets/scale_bars/scale_bar_wind.dart';

class MapChange {
  String checkTypeOfMap(String? valueFromDropDownList) {
    switch (valueFromDropDownList) {
      case "Temperature":
        return "TA2";
      case "Precipitation":
        return "PR0";
      case "Wind":
        return "WS10";
      case "Humidity":
        return "HRD0";
      case "Pressure":
        return "APM";
      case "Cloudiness":
        return "CL";
      default:
        return "TA2";
    }
  }

  String checkOpacityOfMap(String? valueFromDropDownList) {
    switch (valueFromDropDownList) {
      case "Temperature":
        return "0.7";
      case "Precipitation":
        return "1";
      case "Wind":
        return "1";
      case "Humidity":
        return "1";
      case "Pressure":
        return "0.4";
      case "Cloudiness":
        return "1";
      default:
        return "0.8";
    }
  }

  Widget checkScaleBar(String? valueFromDropDownList) {
    switch (valueFromDropDownList) {
      case "Temperature":
        return const ScaleBarTemp();
      case "Precipitation":
        return const ScaleBarPrecipitation();
      case "Wind":
        return const ScaleBarWind();
      case "Humidity":
        return const ScaleBarHumidity();
      case "Pressure":
        return const ScaleBarPressure();
      case "Cloudiness":
        return const ScaleBarClouds();
      default:
        return const ScaleBarTemp();
    }
  }
}

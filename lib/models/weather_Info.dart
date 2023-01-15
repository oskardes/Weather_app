import 'package:weather_app/models/clouds.dart';
import 'package:weather_app/models/coord.dart';
import 'package:weather_app/models/main_Info.dart';
import 'package:weather_app/models/rain.dart';
import 'package:weather_app/models/snow.dart';
import 'package:weather_app/models/sys.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/wind.dart';

class WeatherInfo {
  Coord? coord;
  List<Weather?>? weather;
  String? base;
  MainInfo? main;
  int? visibility;
  Wind? wind;
  Rain? rain;
  Snow? snow;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherInfo({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
    this.snow,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) => WeatherInfo(
        coord: Coord.fromJson(json["coord"]),
        weather: json["weather"] == null
            ? []
            : List<Weather?>.from(
                json["weather"]!.map((x) => Weather.fromJson(x))),
        base: json["base"],
        main: MainInfo.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        rain: json["rain"] == null
            ? Rain(lastH: 0, last3H: 0)
            : Rain.fromJson(json["rain"]),
        snow: json["snow"] == null
            ? Snow(lastH: 0, last3H: 0)
            : Snow.fromJson(json["snow"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord!.toJson(),
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x!.toJson())),
        "base": base,
        "main": main!.toJson(),
        "visibility": visibility,
        "wind": wind!.toJson(),
        "rain": rain!.toJson(),
        "snow": snow!.toJson(),
        "clouds": clouds!.toJson(),
        "dt": dt,
        "sys": sys,
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

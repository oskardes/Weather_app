import 'package:weather_app/models/components.dart';
import 'package:weather_app/models/main_air_polution.dart';

class ListElement {
  int? dt;
  MainAirPolution? main;
  Components? components;

  ListElement({
    this.dt,
    this.main,
    this.components,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: MainAirPolution.fromJson(json['main']),
        components: Components.fromJson(json["components"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main!.toJson(),
        "components": components!.toJson(),
      };
}

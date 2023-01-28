import 'package:weather_app/models/coord.dart';
import 'package:weather_app/models/list_elements.dart';

class AirPolution {
  //List<int>? coord;
  Coord? coord;
  List<ListElement?>? list;

  AirPolution({
    this.coord,
    this.list,
  });

  factory AirPolution.fromJson(Map<String, dynamic> json) => AirPolution(
        //coord: List<int>.from(json["coord"].map((x) => x)),
        coord: Coord.fromJson(json["coord"]),
        list: json["list"] == null
            ? []
            : List<ListElement?>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        //"coord": List<dynamic>.from(coord!.map((x) => x)),
        "coord": coord!.toJson(),
        "list": List<dynamic>.from(list!.map((x) => x!.toJson())),
      };
}

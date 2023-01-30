import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/listElements.dart';

class Predict {
  City city;
  String cod;
  double message;
  int cnt;
  List<ListElemets> list;

  Predict({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  factory Predict.fromJson(Map<String, dynamic> json) => Predict(
        city: City.fromJson(json["city"]),
        cod: json["cod"],
        message: json["message"]?.toDouble(),
        cnt: json["cnt"],
        list: List<ListElemets>.from(
            json["list"].map((x) => ListElemets.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city": city.toJson(),
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

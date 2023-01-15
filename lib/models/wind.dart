class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
        deg: json["deg"],
        gust: json["gust"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}

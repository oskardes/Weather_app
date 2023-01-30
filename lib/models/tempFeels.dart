class TempFeels {
  double day;
  double night;
  double eve;
  double morn;

  TempFeels({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory TempFeels.fromJson(Map<String, dynamic> json) => TempFeels(
        day: json["day"]?.toDouble(),
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

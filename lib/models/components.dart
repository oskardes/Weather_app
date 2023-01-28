class Components {
  double? co;
  double? no;
  double? no2;
  double? o3;
  double? so2;
  double? pm2_5;
  double? pm10;
  double? nh3;

  Components({
    this.co,
    this.no,
    this.no2,
    this.o3,
    this.so2,
    this.pm2_5,
    this.pm10,
    this.nh3,
  });

  factory Components.fromJson(Map<String, dynamic> json) => Components(
        co: json['co'],
        no: json['no'],
        no2: json['no2'],
        o3: json['o3'],
        so2: json['so2'],
        pm2_5: json['pm2_5'],
        pm10: json['pm10'],
        nh3: json['nh3'],
      );

  Map<String, dynamic> toJson() => {
        "co": co,
        "no": no,
        "no2": no2,
        "o3": o3,
        "so2": so2,
        "pm2_5": pm2_5,
        "pm10": pm10,
        "nh3": nh3
      };
}

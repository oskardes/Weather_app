class Snow {
  double? lastH;
  double? last3H;

  Snow({
    this.lastH,
    this.last3H,
  });

  factory Snow.fromJson(Map<String, dynamic> json) => Snow(
        lastH: json["1h"],
        last3H: json["3h"],
      );

  Map<String, dynamic> toJson() => {
        "1h": lastH,
        "3h": last3H,
      };
}

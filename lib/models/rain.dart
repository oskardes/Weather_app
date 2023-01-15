class Rain {
  double? lastH;
  double? last3H;

  Rain({
    this.lastH,
    this.last3H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        lastH: json["1h"],
        last3H: json["3h"],
      );

  Map<String, dynamic> toJson() => {
        "1h": lastH,
        "3h": last3H,
      };
}

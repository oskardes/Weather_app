class MainAirPolution {
  int? aqi;

  MainAirPolution({
    this.aqi,
  });

  factory MainAirPolution.fromJson(Map<String, dynamic> json) =>
      MainAirPolution(
        aqi: json["aqi"],
      );

  Map<String, dynamic> toJson() => {
        "aqi": aqi,
      };
}

class Clouds {
  int? cloudsAll;

  Clouds({this.cloudsAll});

  factory Clouds.fromJson(Map<String, dynamic> json) =>
      Clouds(cloudsAll: json["all"]);

  Map<String, dynamic> toJson() => {
        "all": cloudsAll,
      };
}

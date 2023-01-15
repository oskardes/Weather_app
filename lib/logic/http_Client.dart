import 'package:weather_app/models/weather_Info.dart';

import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'dart:convert';

class HTTPClient {
  final _appid = "f33c6d263c1af0b1db4d50d873b51e36";
  final units = "metric";
  final baseURL = "api.openweathermap.org";

  Future<WeatherInfo> getCurrentWeather(String lat, String lon) async {
    final queryParameters = {
      'lat': lat,
      'lon': lon,
      'appid': _appid,
      'units': units,
    };

    final url = Uri.https(baseURL, '/data/2.5/weather', queryParameters);

    final response = await http.get(url);

    developer.log(response.body);
    final json = jsonDecode(response.body);
    return WeatherInfo.fromJson(json);
  }
}

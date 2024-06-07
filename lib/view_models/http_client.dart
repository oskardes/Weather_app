import 'package:weather_app/models/predict.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HTTPClient {
  final _appid = "**********************";
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
    final json = jsonDecode(response.body);
    return WeatherInfo.fromJson(json);
  }

  Future<Predict> getPredictWeather(String lat, String lon) async {
    final queryParameters = {
      'lat': lat,
      'lon': lon,
      'appid': _appid,
      'units': units,
      'cnt': "7"
    };

    final url = Uri.https(baseURL, 'data/2.5/forecast/daily', queryParameters);

    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return Predict.fromJson(json);
  }
}

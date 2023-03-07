import 'package:test/test.dart';
import 'package:weather_app/models/predict.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/view_models/http_client.dart';

void main() {
  HTTPClient client = HTTPClient();

  test('1. Check return current weahter data - name of city', () async {
    final WeatherInfo weatherInfo =
        await client.getCurrentWeather('55.75', '37.62');
    expect(weatherInfo.name, 'Moscow');
  });

  test('2. Check return predict weather data - name of city', () async {
    final Predict predictData =
        await client.getPredictWeather('55.75', '37.62');
    expect(predictData.city.name, 'Moscow');
  });
}

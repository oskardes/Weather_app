import 'package:test/test.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/coord.dart';

void main() {
  test('1. Check act maping json to Object', () {
    Map<String, dynamic> json = {
      'id': 25,
      'name': 'London',
      'coord': {'lat': 51.5085, 'lon': -0.1257},
      'country': 'GB',
      'population': 1000000,
      'timezone': 4544564
    };

    City mapCity = City.fromJson(json);

    City manualCity = City(
        id: 25,
        name: 'London',
        coord: Coord(lat: 51.5085, lon: -0.1257),
        country: 'GB',
        population: 1000000,
        timezone: 4544564);

    expect(mapCity.name, manualCity.name);
    expect(mapCity.coord.lat, manualCity.coord.lat);
    expect(mapCity.coord.lon, manualCity.coord.lon);
    expect(mapCity.country, manualCity.country);
    expect(mapCity.population, manualCity.population);
    expect(mapCity.timezone, manualCity.timezone);
  });
}

import 'package:test/test.dart';
import 'package:weather_app/models/tempFeels.dart';

void main() {
  test('1. Check act maping json to Object', () {
    Map<String, dynamic> json = {
      'day': 25.0,
      'eve': 17.0,
      'morn': 15.0,
      'night': 10.0,
    };

    TempFeels mapTemp = TempFeels.fromJson(json);

    TempFeels manualtemp = TempFeels(
      day: 25.0,
      eve: 17.0,
      morn: 15.0,
      night: 10.0,
    );

    expect(mapTemp.day, manualtemp.day);
    expect(mapTemp.eve, manualtemp.eve);
    expect(mapTemp.morn, manualtemp.morn);
    expect(mapTemp.night, manualtemp.night);
  });
}

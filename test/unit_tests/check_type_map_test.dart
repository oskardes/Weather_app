import 'package:test/test.dart';
import 'package:weather_app/view_models/map_change.dart';

void main() {
  test('1. Check return type from switch', () {
    final MapChange mapChange = MapChange();

    String typeOfMap = mapChange.checkTypeOfMap('Pressure');
    expect(typeOfMap, 'APM');
  });

  test('2. Check return type from switch', () {
    final MapChange mapChange = MapChange();

    String typeOfMap = mapChange.checkTypeOfMap('Temperature');
    expect(typeOfMap, 'TA2');
  });

  test('1. Check return opacity from switch', () {
    final MapChange mapChange = MapChange();

    String opacityValue = mapChange.checkOpacityOfMap('Wind');
    expect(opacityValue, '1');
  });

  test('2. Check return opacity from switch', () {
    final MapChange mapChange = MapChange();

    String opacityValue = mapChange.checkOpacityOfMap('Humidity');
    expect(opacityValue, '1');
  });
}

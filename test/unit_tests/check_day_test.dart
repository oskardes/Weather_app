import 'package:test/test.dart';
import 'package:weather_app/view_models/day_name.dart';

void main() {
  test('1. Check read current date', () {
    DayName dayName = DayName();

    DateTime currentDate = dayName.getCurrentData();
    expect(currentDate, DateTime.now());
  });

  test('2. Check return short name of day', () {
    DayName dayName = DayName();

    String shortName = dayName.parseDateofWeekToShort('Friday');
    expect(shortName, 'FRI');
  });
}

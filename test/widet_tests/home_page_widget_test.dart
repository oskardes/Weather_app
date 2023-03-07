import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/views/home_page.dart';

void main() {
  testWidgets('checkGoToMapButton exisiting', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: HomePage(
      lat: '22.3',
      lon: '17.5',
    )));

    final findButtonMap = find.byKey(const Key('goToMaps'));
    expect(findButtonMap, findsOneWidget);
  });

  testWidgets('checkGoToPredictionButton exisiting',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: HomePage(
      lat: '22.3',
      lon: '17.5',
    )));

    final findButtonMap = find.byKey(const Key('goToPrediction'));
    expect(findButtonMap, findsOneWidget);
  });
}

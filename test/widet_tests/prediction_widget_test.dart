import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/views/prediction.dart';

void main() {
  testWidgets('CheckLoadGalery exisiting', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Prediction()));

    final findButtonMap = find.byKey(const Key('LoadGalery'));
    expect(findButtonMap, findsOneWidget);
  });

  testWidgets('CheckButtonTakePhoto exisiting', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Prediction()));

    final findButtonMap = find.byKey(const Key('TakePhoto'));
    expect(findButtonMap, findsOneWidget);
  });
}

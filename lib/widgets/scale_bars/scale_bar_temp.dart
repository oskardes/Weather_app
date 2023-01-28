import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScaleBarTemp extends StatelessWidget {
  const ScaleBarTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      interval: 20,
      numberFormat: NumberFormat("#°C"),
      axisLabelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      minimum: -40,
      maximum: 40,
      ranges: [
        LinearGaugeRange(
          position: LinearElementPosition.inside,
          startValue: -40,
          midValue: 0,
          endValue: 40,
          shaderCallback: (bounds) => const RadialGradient(
              center: Alignment.topLeft,
              radius: 50,
              colors: [
                Color(0xFF821692),
                Color(0xFF8257DB),
                Color(0xFF208CEC),
                Color(0xFF20C4E8),
                Color(0xFF23DDDD),
                Color(0xFFC2FF28),
                Color(0xFFFFF028),
                Color(0xFFFFC228),
                Color(0xFFFC8014),
              ]).createShader(bounds),
        )
      ],
    );
  }
}

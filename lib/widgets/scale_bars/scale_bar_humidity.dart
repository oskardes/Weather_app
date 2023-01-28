import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScaleBarHumidity extends StatelessWidget {
  const ScaleBarHumidity({super.key});

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      numberFormat: NumberFormat("#%"),
      axisLabelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      minimum: 0,
      maximum: 1,
      ranges: [
        LinearGaugeRange(
          position: LinearElementPosition.inside,
          startValue: 0,
          midValue: 0.5,
          endValue: 1,
          shaderCallback: (bounds) => const RadialGradient(
              center: Alignment.topLeft,
              radius: 50,
              colors: [
                Color(0xFFdb1200),
                Color(0xFF965700),
                Color(0xFF8bd600),
                Color(0xFF8bd600),
                Color(0xFF00a808),
                Color(0xFF000099),
              ]).createShader(bounds),
        )
      ],
    );
  }
}

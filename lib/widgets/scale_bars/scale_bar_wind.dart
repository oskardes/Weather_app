import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScaleBarWind extends StatelessWidget {
  const ScaleBarWind({super.key});

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      interval: 50,
      numberFormat: NumberFormat("#m/s"),
      axisLabelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      minimum: 0,
      maximum: 200,
      ranges: [
        LinearGaugeRange(
          position: LinearElementPosition.inside,
          startValue: 0,
          midValue: 100,
          endValue: 200,
          shaderCallback: (bounds) => const RadialGradient(
              center: Alignment.topLeft,
              radius: 50,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFE0D0E2),
                Color(0xFFD5BFD8),
                Color(0xFFCFB2D0),
                Color(0xFFC1A2C6),
                Color(0xFFBC9CC2),
                Color(0xFF9A78B8),
                Color(0xFFA387B9),
              ]).createShader(bounds),
        )
      ],
    );
  }
}

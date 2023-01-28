import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScaleBarPressure extends StatelessWidget {
  const ScaleBarPressure({super.key});

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      interval: 30,
      numberFormat: NumberFormat("#hPa"),
      axisLabelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      minimum: 950,
      maximum: 1070,
      ranges: [
        LinearGaugeRange(
          position: LinearElementPosition.inside,
          startValue: 950,
          midValue: 1000,
          endValue: 1070,
          shaderCallback: (bounds) => const RadialGradient(
              center: Alignment.topLeft,
              radius: 60,
              colors: [
                Color(0xFF1989FF),
                Color(0xFF5DD4DA),
                Color(0xFFA6EF8E),
                Color(0xFFE1CF21),
                Color(0xFFF68C24),
                Color(0xFFF97529),
                Color(0xFFE93D41),
                Color(0xFFD01F20),
              ]).createShader(bounds),
        )
      ],
    );
  }
}

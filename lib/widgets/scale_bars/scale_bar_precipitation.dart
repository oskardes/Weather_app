import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScaleBarPrecipitation extends StatelessWidget {
  const ScaleBarPrecipitation({super.key});

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      interval: 10,
      numberFormat: NumberFormat("#mm/s"),
      axisLabelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
      minimum: 0,
      maximum: 60,
      ranges: [
        LinearGaugeRange(
          position: LinearElementPosition.inside,
          startValue: 0,
          midValue: 50,
          endValue: 100,
          shaderCallback: (bounds) => const RadialGradient(
              center: Alignment.topLeft,
              radius: 50,
              colors: [
                Color(0xFFF2FFF7),
                Color(0xFF67FCA2),
                Color(0xFF19B319),
                Color(0xFF196719),
                Color(0xFFCEDE19),
                Color(0xFFFCD719),
                Color(0xFFFFA419),
                Color(0xFFFF3C19),
                Color(0xFFFF1963),
                Color(0xFFFF1994),
                Color(0xFFBD3BC2),
              ]).createShader(bounds),
        )
      ],
    );
  }
}

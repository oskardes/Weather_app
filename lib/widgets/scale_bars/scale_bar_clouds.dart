import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScaleBarClouds extends StatelessWidget {
  const ScaleBarClouds({super.key});

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      numberFormat: NumberFormat("#%"),
      axisLabelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      minimum: 0,
      maximum: 1,
      ranges: [
        LinearGaugeRange(
          position: LinearElementPosition.inside,
          startValue: 0,
          endValue: 1,
          shaderCallback: (bounds) => const RadialGradient(
              center: Alignment.topLeft,
              radius: 60,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFDFEFF),
                Color(0xFFEDF3F4),
                Color(0xFFE7E7E7),
                Color(0xFFE9E9E9),
                Color(0xFFDFDEDE),
                Color(0xDEDEDED8),
                Color(0xFFC1C1C1),
              ]).createShader(bounds),
        )
      ],
    );
  }
}

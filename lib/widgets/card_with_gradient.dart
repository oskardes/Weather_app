import 'package:flutter/material.dart';

class CardWithGradient extends StatelessWidget {
  final Widget child;
  final double width;
  final Alignment beginAlignment;
  final Alignment endAlignment;

  const CardWithGradient({
    Key? key,
    required this.child,
    required this.width,
    required this.beginAlignment,
    required this.endAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: width,
            margin: const EdgeInsets.all(18),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: LinearGradient(
                begin: beginAlignment,
                end: endAlignment,
                colors: const <Color>[
                  Color(0xFFE562E6),
                  Color(0xFF5064F0),
                ],
              ),
            ),
            child: child),
      ],
    );
  }
}

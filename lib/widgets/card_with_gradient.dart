import 'package:flutter/material.dart';

class CardWithGradient extends StatelessWidget {
  final double width;
  final Alignment beginAlignment;
  final Alignment endAlignment;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Widget child;

  const CardWithGradient({
    Key? key,
    required this.width,
    required this.beginAlignment,
    required this.endAlignment,
    required this.child,
    required this.margin,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: width,
            margin: margin,
            padding: padding,
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

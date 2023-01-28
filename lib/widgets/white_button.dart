import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function()? fun;
  final double radius;

  const WhiteButton({
    required this.icon,
    required this.color,
    required this.fun,
    required this.radius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(icon, color: color, size: 15),
        onPressed: fun,
      ),
    );
  }
}

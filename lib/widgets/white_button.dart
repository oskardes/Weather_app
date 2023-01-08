import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  const WhiteButton({
    required this.icon,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(icon, color: color, size: 15),
        onPressed: null,
      ),
    );
  }
}

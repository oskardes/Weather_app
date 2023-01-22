import 'package:flutter/material.dart';

class Prediction extends StatelessWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.green,
        child: const Text(
          'Page 2',
          style: TextStyle(fontSize: 50, color: Colors.white),
        ));
  }
}

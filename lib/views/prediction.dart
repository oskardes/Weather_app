import 'package:flutter/material.dart';
import 'package:weather_app/widgets/white_button.dart';

class Prediction extends StatelessWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WhiteButton(
          color: Colors.black,
          fun: () {
            Navigator.pop(context);
          },
          icon: Icons.home,
          radius: 15,
        ),
      ),
    );
  }
}

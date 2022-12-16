import 'package:flutter/material.dart';
import 'package:weather_app/widgets/card_with_gradient.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color(0xFFFAF0FB),
              Color(0xFFF2EAF4),
            ],
          ),
        ),
        child: Column(
          children: [
            CardWithGradient(
              width: double.infinity,
              beginAlignment: Alignment.topLeft,
              endAlignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Placeholder(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Rain showers",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Monday, 12 Feb",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        '21°',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
                        'Fells like 26°',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.air,
                        size: 60,
                        color: Colors.white.withOpacity(0.4),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

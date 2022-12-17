import 'package:flutter/material.dart';
import 'package:weather_app/widgets/WhiteButton.dart';
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
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const WhiteButton(
                  icon: Icons.tune,
                  color: Colors.black,
                ),
                Column(children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 17,
                        height: 15,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.location_on,
                            color: Color(0xFF6764E7),
                            size: 17,
                          ),
                          onPressed: null,
                        ),
                      ),
                      Text(
                        "Warsaw",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: const [
                        CardWithGradient(
                          // padding: EdgeInsets.only(left: 7),
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          width: 50,
                          beginAlignment: Alignment.topLeft,
                          endAlignment: Alignment.topLeft,
                          child: Text(
                            "Updating *",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
                ]),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Image.asset(
                      "images/avatar.png",
                      scale: 0.1,
                    ),
                    onPressed: null,
                  ),
                ),
              ],
            ),
            CardWithGradient(
              margin: const EdgeInsets.all(18),
              padding: const EdgeInsets.all(10),
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

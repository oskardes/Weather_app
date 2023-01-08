import 'package:flutter/material.dart';
import 'package:weather_app/widgets/white_button.dart';

class WhiteCard extends StatelessWidget {
  const WhiteCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(18, 10, 18, 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32), color: Colors.white),
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.cloud),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Air Quaility"),
                    ],
                  ),
                  Column(
                    children: const [
                      WhiteButton(
                        icon: Icons.refresh,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.ac_unit_outlined),
                      Text(
                        'Real Feel',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '23.8',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.ac_unit_outlined),
                      Text(
                        'Wind',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '9 km/h',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.ac_unit_outlined),
                      Text(
                        'SO2',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '0.9',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.ac_unit_outlined),
                      Text(
                        'Poss Rain ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '68%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.ac_unit_outlined),
                      Text(
                        'UV Index',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.ac_unit_outlined),
                      Text(
                        'O3',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '50',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ),
        )
      ],
    );
  }
}

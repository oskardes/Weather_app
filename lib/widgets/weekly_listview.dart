import 'package:flutter/material.dart';

class WeeklyListView extends StatelessWidget {
  final int realDay;

  const WeeklyListView({
    Key? key,
    required this.realDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFFE562E6),
                Color(0xFF5064F0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "MON",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const Text(
                "8 JAN",
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Icon(
                Icons.cloud,
                color: Colors.white,
              ),
              const Text('18°C'),
              Container(
                margin: const EdgeInsets.all(5),
                width: 25,
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32), color: Colors.red),
                child: const Text(
                  '160',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFFE562E6),
                Color(0xFF5064F0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "TUE",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const Text(
                "9 JAN",
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Icon(
                Icons.cloud,
                color: Colors.white,
              ),
              const Text('18°C'),
              Container(
                margin: const EdgeInsets.all(5),
                width: 25,
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32), color: Colors.red),
                child: const Text(
                  '160',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFFE562E6),
                Color(0xFF5064F0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "WED",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const Text(
                "10 JAN",
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Icon(
                Icons.cloud,
                color: Colors.white,
              ),
              const Text('18°C'),
              Container(
                margin: const EdgeInsets.all(5),
                width: 25,
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32), color: Colors.red),
                child: const Text(
                  '160',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFFE562E6),
                Color(0xFF5064F0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "THU",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const Text(
                "11 JAN",
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Icon(
                Icons.cloud,
                color: Colors.white,
              ),
              const Text('18°C'),
              Container(
                margin: const EdgeInsets.all(5),
                width: 25,
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32), color: Colors.red),
                child: const Text(
                  '160',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFFE562E6),
                Color(0xFF5064F0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "FRI",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const Text(
                "12 JAN",
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Icon(
                Icons.cloud,
                color: Colors.white,
              ),
              const Text('18°C'),
              Container(
                margin: const EdgeInsets.all(5),
                width: 25,
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32), color: Colors.red),
                child: const Text(
                  '160',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFFE562E6),
                Color(0xFF5064F0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "SAT",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const Text(
                "13 JAN",
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Icon(
                Icons.cloud,
                color: Colors.white,
              ),
              const Text('18°C'),
              Container(
                margin: const EdgeInsets.all(5),
                width: 25,
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32), color: Colors.red),
                child: const Text(
                  '160',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFFE562E6),
                Color(0xFF5064F0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "SUN",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const Text(
                "14 JAN",
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Icon(
                Icons.cloud,
                color: Colors.white,
              ),
              const Text('18°C'),
              Container(
                margin: const EdgeInsets.all(5),
                width: 25,
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32), color: Colors.red),
                child: const Text(
                  '160',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

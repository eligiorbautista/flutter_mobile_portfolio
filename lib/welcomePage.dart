import 'package:flutter/material.dart';
import 'package:portfolio/homePage.dart';
import 'dart:math';

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 201, 80),
      appBar: null,
      body: mainPage(),
    );
  }

  Widget mainPage() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/eli.jpg'),
                    maxRadius: 90,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Hi, I'm Eli",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Student at Manuel S. Enverga University",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Passionate to develop innovative solutions.", // Passionate to develop innovative solutions for everyone.
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
                      backgroundColor: const Color.fromARGB(255, 32, 32, 30),
                      shadowColor: Colors.black,
                      elevation: 5,
                    ),
                    child: const Text(
                      "See More",
                      style: TextStyle(fontSize: 18),
                      textDirection: TextDirection.ltr,
                    ),
                  )
                ]),
          ]),
    );
  }
}

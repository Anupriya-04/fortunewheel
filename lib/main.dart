import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer timer;
  late Random random;
  late String result;
  late double degree;
  late int time;

  @override
  void initState() {
    super.initState();
    random = Random();
    degree = 0;
    result = "";
  }

  void rotatewheel() {
    time = 3000;
    timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (time > 0) {
        setState(() {
          degree = random.nextInt(360).toDouble();
          result = calculate(degree);
        });
        time = time - 100;
      }
    });
  }



  String calculate(double degree) {
    int lowerPoint = 0;
    int arc = 30;
    int sector = 8;
    String res = "";
    for (int i = sector; i > 0; i--) {
      if (degree > lowerPoint && degree < lowerPoint + arc) {
        res = i.toString();
        if (i == 1) {
          res = "Ayush";
        } else if (i == 2) {
          res = "Aastha";
        } else if (i == 3) {
          res = "Nidhi";
        } else if (i == 4) {
          res = "Vasu";
        } else if (i == 5) {
          res = "Ragini";
        } else if (i == 6) {
          res = "shivam";
        } else if (i == 7) {
          res = "kirti";
        }
        else if(i==0)
          {
            res= "ohhh no!";
          }
        else {
          res = "no one is your friend";
        }
        break;
      }
      lowerPoint = lowerPoint + arc;
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Check who is your friend",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: Transform.rotate(
                        angle: 3.14 / 180 * degree,
                        child: Image(
                          width: 900,
                          height: 300,
                          image: AssetImage("images/spincut.jpg"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image(
                        width: 50,
                        height: 55,
                        image: AssetImage("images/pointercut.jpg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                result,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                rotatewheel();
               // playaudio();
              },
              child: Text("press me", style: TextStyle(fontSize: 40),),

            )
          ],
        ),
      ),
    );
  }
}

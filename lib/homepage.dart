// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:packman/path.dart';
import 'package:packman/pixel.dart';
import 'package:packman/player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  int player = 166;
  int score = 0;
  bool gameFinal = false;

  List<int> barriers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    22,
    33,
    44,
    55,
    66,
    77,
    88,
    99,
    110,
    121,
    132,
    143,
    154,
    165,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    175,
    164,
    153,
    142,
    131,
    120,
    109,
    98,
    87,
    76,
    65,
    54,
    43,
    32,
    21,
    24,
    35,
    46,
    57,
    26,
    37,
    38,
    39,
    28,
    30,
    41,
    52,
    63,
    59,
    70,
    81,
    80,
    79,
    78,
    61,
    72,
    83,
    84,
    85,
    86,
    100,
    101,
    102,
    103,
    105,
    106,
    107,
    108,
    114,
    125,
    116,
    127,
    123,
    134,
    145,
    156,
    129,
    140,
    151,
    162,
    158,
    147,
    148,
    149,
    160
  ];

  List<int> food = [];

  void getFood() {
    for (int i = 0; i < numberOfSquares; i++) {
      if (!barriers.contains(i)) {
        food.add(i);
      }
    }
  }

  String direction = "right";
  bool gameStarted = false;

  void startGame() {
    gameStarted = true;
    getFood();

    Duration duration = Duration(milliseconds: 300);
    Timer.periodic(duration, (timer) {
      if (food.contains(player)) {
        food.remove(player);
        score++;
        if (food.length == 0) {
          gameFinal = true;
        }
      }

      switch (direction) {
        case "left":
          moveLeft();
          break;
        case "right":
          moveRight();
          break;
        case "up":
          moveUp();
          break;
        case "down":
          moveDown();
          break;
      }
    });
  }

  void moveLeft() {
    if (!barriers.contains(player - 1)) {
      setState(() {
        player--;
      });
    }
  }

  void moveRight() {
    if (!barriers.contains(player + 1)) {
      setState(() {
        player++;
      });
    }
  }

  void moveUp() {
    if (!barriers.contains(player - numberInRow)) {
      setState(() {
        player -= numberInRow;
      });
    }
  }

  void moveDown() {
    if (!barriers.contains(player + numberInRow)) {
      setState(() {
        player += numberInRow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      // A flexible child that will grow to fit the viewport but
                      // still be at least as big as necessary to fit its contents.
                      child: Container(
                        color: const Color(0xffee0000), // Red
                        height: 120.0,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("hello"),
                            Text("Goodbye"),
                            Text("hello1"),
                            Text("Goodbye"),
                            Text("hello2"),
                            Text("Goodbye"),
                            Text("hello3"),
                            Text("Goodbye"),
                            Text("hello4"),
                            Text("Goodbye"),
                            Text("hello5"),
                            Text("Goodbye"),
                            Text("hello6"),
                            Text("Goodbye"),
                            Text("hello7"),
                            Text("Goodbye"),
                            Text("hello8"),
                            Text("Goodbye"),
                            Text("hello9"),
                            Text("Goodbye"),
                            Text("hello0"),
                            Text("Goodbye"),
                            Text("hello1"),
                            Text("Goodbye"),
                            Text("hello2"),
                            Text("Goodbye"),
                            Text("hello3"),
                            Text("Goodbye"),
                            Text("hello4"),
                            Text("Goodbye"),
                            Text("hello5"),
                            Text("Goodbye"),
                            Text("hello6"),
                            Text("Goodbye"),
                            Text("hello7"),
                            Text("Goodbye"),
                            Text("hello8"),
                            Text("Goodbye"),
                            Text("hello"),
                            Text("Goodbye"),
                            Text("hello1"),
                            Text("Goodbye"),
                            Text("hello2"),
                            Text("Goodbye"),
                            Text("hello3"),
                            Text("Goodbye"),
                            Text("hello4"),
                            Text("Goodbye"),
                            Text("hello5"),
                            Text("Goodbye"),
                            Text("hello6"),
                            Text("Goodbye"),
                            Text("hello7"),
                            Text("Goodbye"),
                            Text("hello8"),
                            Text("Goodbye"),
                            Text("hello9"),
                            Text("Goodbye"),
                            Text("hello0"),
                            Text("Goodbye"),
                            Text("hello1"),
                            Text("Goodbye"),
                            Text("hello2"),
                            Text("Goodbye"),
                            Text("hello3"),
                            Text("Goodbye"),
                            Text("hello4"),
                            Text("Goodbye"),
                            Text("hello5"),
                            Text("Goodbye"),
                            Text("hello6"),
                            Text("Goodbye"),
                            Text("hello7"),
                            Text("Goodbye"),
                            Text("hello8"),
                            Text("Goodbye"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // A fixed-height child.
                      color: const Color(0xffeeee00), // Yellow
                      height: 120.0,
                      alignment: Alignment.center,
                      child: const Text('Fixed Height Content'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

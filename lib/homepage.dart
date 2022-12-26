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
    if (gameFinal == true) {
      return Scaffold(
          backgroundColor: Colors.grey[700],
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Шуст от\u{00A0}всей души поздравляет вас с\u{00A0}наступающим новым 2023 годом!",
                style: TextStyle(color: Colors.white, fontSize: 40),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset('lib/images/present.gif'),
              )
            ]),
          ));
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          Expanded(
              flex: 5,
              child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.delta.dy > 0) {
                      direction = "down";
                    } else if (details.delta.dy < 0) {
                      direction = "up";
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    if (details.delta.dx > 0) {
                      direction = "right";
                    } else if (details.delta.dx < 0) {
                      direction = "left";
                    }
                  },
                  child: Container(
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: numberOfSquares,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: numberInRow),
                        itemBuilder: (BuildContext context, int index) {
                          if (player == index) {
                            switch (direction) {
                              case "left":
                                return Transform.rotate(
                                  angle: pi,
                                  child: MyPlayer(),
                                );
                                break;
                              case "right":
                                return MyPlayer();
                                break;
                              case "up":
                                return Transform.rotate(
                                  angle: 3 * pi / 2,
                                  child: MyPlayer(),
                                );
                                break;
                              case "down":
                                return Transform.rotate(
                                  angle: pi / 2,
                                  child: MyPlayer(),
                                );
                                break;

                              default:
                                return MyPlayer();
                            }
                          } else if (barriers.contains(index)) {
                            return MyPixel(
                              innerColor: Colors.blue[800],
                              outerColor: Colors.blue[900],
                            );
                          } else if (food.contains(index) || !gameStarted) {
                            return MyPath(
                              innerColor: Colors.yellow,
                              outerColor: Colors.black,
                            );
                          } else {
                            return MyPath(
                              innerColor: Colors.black,
                              outerColor: Colors.black,
                            );
                          }
                        }),
                  ))),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Score: $score",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                GestureDetector(
                  onTap: startGame,
                  child: Text(
                    "P L A Y",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          )),
        ]),
      );
    }
  }
}

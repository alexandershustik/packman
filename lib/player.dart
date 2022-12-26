import 'dart:ui';

import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  const MyPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image.asset('lib/images/packman.png'),
    );
  }
}

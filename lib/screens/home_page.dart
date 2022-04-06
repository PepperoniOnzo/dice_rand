import 'dart:math';

import 'package:dice_rand/widgets/dice.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Random random = Random();
  int _diceNumber = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (() {
          setState(() {
            _diceNumber = random.nextInt(6) + 1;
          });
        }),
        child: Column(children: [
          Expanded(
            flex: 9,
            child: Dice(diceBorder: _diceNumber),
          ),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(35.0),
              child: Text(
                "SHAKE YOUR PHONE\n OR TAP ON THE SCREEN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 4,
                  height: 1.5,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

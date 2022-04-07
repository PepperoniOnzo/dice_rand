import 'dart:math';

import 'package:dice_rand/widgets/circle_anim.dart';
import 'package:dice_rand/widgets/dice_anim.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static const animationDuration = Duration(milliseconds: 500);

  late final AnimationController _controllerDice = AnimationController(
    vsync: this,
    duration: animationDuration,
    reverseDuration: animationDuration,
  );

  late final AnimationController _controllerCircle = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
    reverseDuration: animationDuration,
  );

  Random random = Random();
  int _diceNumber = 1;

  @override
  void initState() {
    _controllerDice.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _diceNumber = random.nextInt(6) + 1;
        });
        Future.delayed(const Duration(milliseconds: 250), () {
          _controllerDice.reverse();
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controllerCircle.dispose();
    _controllerDice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (() {
          setState(() {
            _controllerCircle.forward();
            _controllerDice.forward();
          });
        }),
        child: Column(children: [
          Expanded(
              flex: 9,
              child: Stack(
                children: [
                  DiceAnim(
                      diceBorder: _diceNumber, controllerDice: _controllerDice),
                  CircleAnim(
                    controller: _controllerCircle,
                  )
                ],
              )),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(35.0),
              child: Text(
                "TAP ON THE SCREEN",
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

import 'dart:math';

import 'package:dice_rand/widgets/dice.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static const animationDuration = Duration(milliseconds: 500);

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: animationDuration,
    reverseDuration: animationDuration,
  );

  late final Animation<double> _animationSpining = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ),
  );

  late final Animation<double> _animationOpacity = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ),
  );

  late final Animation<double> _animationSize = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ),
  );


  Random random = Random();
  int _diceNumber = 2;

  @override
  void initState() {
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _diceNumber = random.nextInt(6) + 1;
        });
        Future.delayed(const Duration(milliseconds: 250), () {
          _controller.reverse();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (() {
          setState(() {
            _controller.forward();
          });
        }),
        child: Column(children: [
          Expanded(
            flex: 9,
            child: FadeTransition(
              opacity: _animationOpacity,
              child: RotationTransition(
                turns: _animationSpining,
                child: ScaleTransition(
                  scale: _animationSize,
                  child: Dice(diceBorder: _diceNumber),
                ),
              ),
            ),
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

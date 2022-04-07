import 'package:dice_rand/data/dices.dart';
import 'package:flutter/material.dart';

class DiceAnim extends StatefulWidget {
  DiceAnim({Key? key, required this.diceBorder, required this.controllerDice})
      : super(key: key);

  final int diceBorder;
  final AnimationController controllerDice;

  late final Animation<double> _animationSpining = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: controllerDice,
      curve: Curves.easeIn,
    ),
  );

  late final Animation<double> _animationOpacity = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: controllerDice,
      curve: Curves.easeIn,
    ),
  );

  late final Animation<double> _animationSize = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: controllerDice,
      curve: Curves.easeIn,
    ),
  );

  @override
  State<DiceAnim> createState() => _DiceAnimState();
}

class _DiceAnimState extends State<DiceAnim> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FadeTransition(
      opacity: widget._animationOpacity,
      child: RotationTransition(
        turns: widget._animationSpining,
        child: ScaleTransition(
          scale: widget._animationSize,
          child: CustomPaint(
            painter: DicesBorders(context, widget.diceBorder),
          ),
        ),
      ),
    ));
  }
}

import 'package:dice_rand/data/dices.dart';
import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice({Key? key, required this.diceBorder}) : super(key: key);
  final int diceBorder;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: DicesBorders(context, diceBorder),
      ),
    );
  }
}

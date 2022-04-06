import 'package:dice_rand/data/colors.dart';
import 'package:flutter/material.dart';

class DicesBorders extends CustomPainter {
  BuildContext context;
  final int dice;

  final painter = Paint()
    ..color = ColorsData.red
    ..style = PaintingStyle.fill;

  final dicePath = Path();

  DicesBorders(this.context, this.dice);

  @override
  void paint(Canvas canvas, Size size) {
    final circleRadius = MediaQuery.of(context).size.width * 0.03;
    final paddingStart = MediaQuery.of(context).size.width * 0.2;
    switch (dice) {
      case 1:
        canvas.drawCircle(const Offset(0, 0), circleRadius, painter);
        break;
      case 2:
        canvas.drawCircle(
            Offset(-paddingStart, paddingStart), circleRadius, painter);
        canvas.drawCircle(
            Offset(paddingStart, -paddingStart), circleRadius, painter);
        break;
      case 3:
        canvas.drawCircle(const Offset(0, 0), circleRadius, painter);
        canvas.drawCircle(
            Offset(-paddingStart, paddingStart), circleRadius, painter);
        canvas.drawCircle(
            Offset(paddingStart, -paddingStart), circleRadius, painter);
        break;
      case 4:
        canvas.drawCircle(
            Offset(-paddingStart, paddingStart), circleRadius, painter);
        canvas.drawCircle(
            Offset(paddingStart, -paddingStart), circleRadius, painter);
        canvas.drawCircle(
            Offset(-paddingStart, -paddingStart), circleRadius, painter);
        canvas.drawCircle(
            Offset(paddingStart, paddingStart), circleRadius, painter);
        break;
      case 5:
        canvas.drawCircle(const Offset(0, 0), circleRadius, painter);
        canvas.drawCircle(
            Offset(-paddingStart, paddingStart), circleRadius, painter);
        canvas.drawCircle(
            Offset(paddingStart, -paddingStart), circleRadius, painter);
        canvas.drawCircle(
            Offset(-paddingStart, -paddingStart), circleRadius, painter);
        canvas.drawCircle(
            Offset(paddingStart, paddingStart), circleRadius, painter);
        break;
      case 6:
        canvas.drawCircle(Offset(paddingStart, 0), circleRadius, painter);
        canvas.drawCircle(Offset(-paddingStart, 0), circleRadius, painter);
        canvas.drawCircle(
            Offset(-paddingStart, paddingStart), circleRadius, painter);
        canvas.drawCircle(
            Offset(paddingStart, -paddingStart), circleRadius, painter);
        canvas.drawCircle(
            Offset(-paddingStart, -paddingStart), circleRadius, painter);
        canvas.drawCircle(
            Offset(paddingStart, paddingStart), circleRadius, painter);
        break;
      default:
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

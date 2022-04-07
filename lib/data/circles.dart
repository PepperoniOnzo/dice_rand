import 'package:flutter/material.dart';

class Circles extends CustomPainter {
  BuildContext context;
  final int type;

  final painterFilled = Paint()
    ..color = Colors.white.withOpacity(0.1)
    ..style = PaintingStyle.fill;

  Paint painterBorder = Paint()
    ..color = Colors.white.withOpacity(0.1)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 30;

  final dicePath = Path();

  Circles(this.context, this.type);

  @override
  void paint(Canvas canvas, Size size) {
    double circleRadius = MediaQuery.of(context).size.width;
    switch (type) {
      case 1:
        circleRadius = MediaQuery.of(context).size.width * 0.15;
        canvas.drawCircle(const Offset(0, 0), circleRadius, painterFilled);
        break;
      case 2:
        painterBorder.strokeWidth = 30;
        circleRadius = MediaQuery.of(context).size.width * 0.2;
        canvas.drawCircle(const Offset(0, 0), circleRadius, painterBorder);
        break;
      case 3:
        painterBorder.strokeWidth = 10;

        circleRadius = MediaQuery.of(context).size.width * 0.27;
        canvas.drawCircle(const Offset(0, 0), circleRadius, painterBorder);
        break;
      default:
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

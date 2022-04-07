import 'package:dice_rand/data/circles.dart';
import 'package:flutter/material.dart';

class CircleAnim extends StatefulWidget {
  CircleAnim({Key? key, required this.controller}) : super(key: key);

  final AnimationController controller;

  late final Animation<double> _animationOpacityFirst = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ),
  );

  @override
  State<CircleAnim> createState() => _CircleAnimState();
}

class _CircleAnimState extends State<CircleAnim> with TickerProviderStateMixin {
  late final AnimationController _controllerCircleSecond = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 75),
  );

  late final AnimationController _controllerCircleThird = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 50),
    reverseDuration: Duration(milliseconds: 150),
  );

  late final Animation<double> _animationOpacitySecond = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controllerCircleSecond,
      curve: Curves.easeIn,
    ),
  );
  late final Animation<double> _animationOpacityThird = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controllerCircleThird,
      curve: Curves.easeIn,
    ),
  );

  @override
  void initState() {
    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 100), () {
          widget.controller.reverse();
        });
        _controllerCircleSecond.forward();
      }
    });
    _controllerCircleSecond.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 50), () {
          _controllerCircleSecond.reverse();
        });
        _controllerCircleThird.forward();
      }
    });
    _controllerCircleThird.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 25), () {
          _controllerCircleThird.reverse();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerCircleSecond.dispose();
    _controllerCircleThird.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          FadeTransition(
            opacity: widget._animationOpacityFirst,
            child: CustomPaint(
              painter: Circles(context, 1),
            ),
          ),
          FadeTransition(
            opacity: _animationOpacitySecond,
            child: CustomPaint(
              painter: Circles(context, 2),
            ),
          ),
          FadeTransition(
            opacity: _controllerCircleThird,
            child: CustomPaint(
              painter: Circles(context, 3),
            ),
          ),
        ],
      ),
    );
  }
}

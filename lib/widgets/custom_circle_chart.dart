import 'dart:math';

import 'package:flutter/material.dart';

class CustomCircleChart extends StatelessWidget {
  double? radius;
  double? width;
  double? height;
  int? duration;
  List<BoxShadow>? shadows;
  Color? backgroundPainter;
  Color? foregroundPainter;
  double? stockCircles;
  Widget? title;
  final AnimationController animationController;
  final Animation<double> animation;
  CustomCircleChart(
      {Key? key,
      this.radius,
      this.width,
      this.height,
      this.shadows,
      this.duration,
      this.backgroundPainter,
      this.foregroundPainter,
      this.title,
      required this.animationController,
      required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        foregroundPainter: CircleChart(animation.value, radius ?? 50,
            stockCircles, backgroundPainter, foregroundPainter),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: shadows ??
                  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
          width: width ?? 120,
          height: height ?? 120,
          child: Center(child: title),
        ));
  }
}

class CircleChart extends CustomPainter {
  double? stockCircles;
  double radius;
  double currentProgess;
  Color? backgroundPainter;
  Color? foregroundPainter;

  CircleChart(this.currentProgess, this.radius, this.stockCircles,
      this.backgroundPainter, this.foregroundPainter);
  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = stockCircles ?? 10.0
      ..color = backgroundPainter ?? Color(0xff0F218B)
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, circle);
    Paint animationArc = Paint()
      ..strokeWidth = stockCircles ?? 10.0
      ..color = foregroundPainter ?? Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double engle = 2 * pi * (currentProgess / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi, engle,
        false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

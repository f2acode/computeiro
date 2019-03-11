import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CurvedSlider extends CustomPainter {
  CurvedSlider({
    this.lineColor,
    this.dotColor,
    this.completePercent,
    this.width,
    this.currentValue,
    this.rangeValue,
  });

  Color lineColor;
  Color dotColor;
  double completePercent;
  double width;
  double currentValue;
  double rangeValue;

  double def(double x) {
    return -1 * pow(x, 2);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint sliderBack = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    // draw curve
    final List<Offset> points = <Offset>[];

    for (double i = -10; i <= 10; i += 0.1) {
      points.add(Offset(size.width / 2 + i * 10, size.height + def(i) / 3));
    }

    canvas.drawPoints(
      PointMode.points,
      points,
      sliderBack,
    );

    // draw point
    final double whereIs = -10 + 20 * (currentValue / rangeValue);

    final Offset dotCenter = Offset(
      size.width / 2 + whereIs * 10,
      size.height + def(whereIs) / 3,
    );

    final Paint dot = Paint()
      ..color = dotColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(dotCenter, 20, dot);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

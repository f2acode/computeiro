import 'dart:math';
import 'package:flutter/material.dart';

class CurvedSlider extends CustomPainter {
  CurvedSlider({
    this.lineColor,
    this.dotColor,
    this.completePercent,
    this.width,
  });

  Color lineColor;
  Color dotColor;
  double completePercent;
  double width;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint sliderBack = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);

    const double arcAngle = 2 * pi * .5;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -pi * 2,
      arcAngle,
      false,
      sliderBack,
    );

    final Offset dotCenter = Offset(size.width / 4, size.height / 2);

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

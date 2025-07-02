import 'package:flutter/material.dart';

class PokeballBackWidget extends CustomPainter {
  PokeballBackWidget({required this.color, required this.altColor});

  final Color color;
  final Color altColor;

  @override
  void paint(Canvas canvas, Size size){
    final altPaint = Paint()
      ..color = altColor
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = altColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.22), 110, paint);
      canvas.drawLine(Offset(size.width * 0.5, size.height * 0.22), Offset(size.width, size.height * 0.22), linePaint);
      canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.22), 55, altPaint);
      canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.22), 30, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return false;
  }
}
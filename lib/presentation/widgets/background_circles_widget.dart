import 'package:flutter/material.dart';

class BackgroundCirclesWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size){
    final paint = Paint()
      ..color = const Color.fromARGB(255, 126, 25, 28)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

      // Top left circles
      canvas.drawCircle(Offset(0, size.height * 0.22), 100, paint);
      canvas.drawCircle(Offset(0, size.height * 0.22), 50, paint);

      // Top right circles
      canvas.drawCircle(Offset(size.width, size.height * 0.22), 100, paint);
      canvas.drawCircle(Offset(size.width, size.height * 0.22), 50, paint);

      // Bottom left circles
      canvas.drawCircle(Offset(0, size.height * 0.78), 100, paint);
      canvas.drawCircle(Offset(0, size.height * 0.78), 50, paint);

      // Bottom right circles
      canvas.drawCircle(Offset(size.width, size.height * 0.78), 100, paint);
      canvas.drawCircle(Offset(size.width, size.height * 0.78), 50, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
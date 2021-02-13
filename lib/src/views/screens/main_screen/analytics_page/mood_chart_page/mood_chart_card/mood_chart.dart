import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'dart:ui' as ui;


class MoodChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.orange,
      width: double.infinity,
      height: dp(220),
      child: CustomPaint(
        painter: MoodChartPainter(),
      ),
    );
  }
}

class MoodChartPainter extends CustomPainter {
  List<double> _verticalPointPositions = List.generate(7, (index) => null);
  List<double> _horizontalPointPositions = List.generate(7, (index) => null);

  @override
  void paint(Canvas canvas, Size size) {
    _calculatePointPositions(size);
    _drawHorizontalLines(canvas, size);
    _drawCurve(canvas, size);
    _drawTestLine(canvas, size);
  }

  void _calculatePointPositions(Size size) {
    final verticalInterval = (size.height - dp(20)) / 6;
    for (int i = 0; i < 7; i++) {
      _verticalPointPositions[i] = verticalInterval * i + dp(15);
    }

    final horizontalInterval = (size.width - dp(20)) / 6;
    for (int i = 0; i < 7; i++) {
      _horizontalPointPositions[i] = horizontalInterval * i + dp(10);
    }
  }

  void _drawHorizontalLines(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CustomColors.purpleMegaDark
      ..strokeWidth = dp(1);

    for (int i = 0; i < 7; i++) {
      final y = _verticalPointPositions[i];
      final p1 = Offset(0, y);
      final p2 = Offset(size.width, y);
      canvas.drawLine(p1, p2, paint);
    }
  }

  void _drawCurve(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red;

    final curvePoints = List.generate(7, (index) {
      final x = _horizontalPointPositions[index];
      final y = _verticalPointPositions[4 - (index / 2).round()];
      return Offset(x, y);
    });

    for (var point in curvePoints) {
      canvas.drawCircle(point, dp(3), paint);
    }
  }

  void _drawTestLine(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(0, 0),
          Offset(0, size.height),
          [
            Colors.green,
            Colors.blue,
            Colors.red,
          ],
          [0, 0.5, 1]
      )
      ..strokeWidth = dp(3);
    final p1 = Offset(0, 0);
    final p2 = Offset(size.width, size.height);

    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
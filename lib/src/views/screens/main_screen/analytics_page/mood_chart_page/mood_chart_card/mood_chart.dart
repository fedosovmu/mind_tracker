import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';


class MoodChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: dp(220),
      child: Consumer<MoodAssessmentsProvider> (
        builder: (context, moodAssessmentsProvider, child) {
          print(moodAssessmentsProvider.moodAssessments);
          return CustomPaint(
            painter: MoodChartPainter([2, 5.3, 4, 4.5, 4.9, 6, 5.5]),
          );
        }
      )
    );
  }
}

class MoodChartPainter extends CustomPainter {
  List<double> _horizontalPointPositions = List.generate(7, (index) => null);
  final List<double> averageMoodForPeriods;

  MoodChartPainter(this.averageMoodForPeriods);

  @override
  void paint(Canvas canvas, Size size) {
    _calculatePointPositions(size);
    _drawHorizontalLines(canvas, size);
    _drawCurve(canvas, size);
  }

  void _calculatePointPositions(Size size) {
    final horizontalPadding = dp(45);
    final horizontalInterval = (size.width - horizontalPadding) / 6;
    for (int i = 0; i < 7; i++) {
      _horizontalPointPositions[i] = horizontalInterval * i + horizontalPadding / 2;
    }
  }

  Offset _getPointPositionByMood(int index, double mood) {
    final horizontalStartPosition = dp(15);
    final horizontalInterval = dp(33);
    final y = (7 - mood) * horizontalInterval + horizontalStartPosition;
    return Offset(_horizontalPointPositions[index], y);
  }

  void _drawHorizontalLines(Canvas canvas, Size size) {
    final horizontalLinesPaint = Paint()
      ..color = CustomColors.purpleMegaDark
      ..strokeWidth = dp(1);

    final verticalInterval = (size.height - dp(20)) / 6;
    final horizontalPadding = dp(20);
    for (int i = 0; i < 7; i++) {
      final y = verticalInterval * i + dp(15);
      final p1 = Offset(horizontalPadding / 2, y);
      final p2 = Offset(size.width - (horizontalPadding / 2), y);
      canvas.drawLine(p1, p2, horizontalLinesPaint);
    }
  }

  void _drawCurve(Canvas canvas, Size size) {
    final gradientShader = ui.Gradient.linear(
        Offset(0, size.height),
        Offset(0, 0),
        List.generate(CustomColors.moods.length, (index) => CustomColors.moods[index+1]),
        List.generate(CustomColors.moods.length, (index) => (1 / CustomColors.moods.length * index))
    );

    final moodColorsGradientStrokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = dp(1)
      ..shader = gradientShader;

    final moodColorsGradientFillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradientShader;

    List<Offset> curvePoints = [];
    for (var i = 0; i < 7; i++) {
      final mood = averageMoodForPeriods[i].toDouble();
      final point = _getPointPositionByMood(i, mood);
      curvePoints.add(point);
      canvas.drawCircle(point, dp(3), moodColorsGradientFillPaint);
    }

    final path = Path();
    final p0 = curvePoints[0];
    path.moveTo(p0.dx, p0.dy);
    for (int i = 1; i < 7; i++) {
      var p = curvePoints[i];
      path.lineTo(p.dx, p.dy);
    }

    canvas.drawPath(path, moodColorsGradientStrokePaint);
  }

  @override
  bool shouldRepaint(covariant MoodChartPainter oldDelegate) { 
    return false;
  }
}
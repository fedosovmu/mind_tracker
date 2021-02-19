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
          return CustomPaint(
            painter: MoodChartPainter(
                averageDailyMoodForWeek: moodAssessmentsProvider.getAverageDailyMoodForWeek()
            ),
          );
        }
      )
    );
  }
}

class MoodChartPainter extends CustomPainter {
  final List<double> averageDailyMoodForWeek;
  final _horizontalLinesPadding = dp(10);
  final _verticalLinesPadding = dp(20);

  MoodChartPainter({this.averageDailyMoodForWeek});

  @override
  void paint(Canvas canvas, Size size) {
    _drawHorizontalLines(canvas, size);
    _drawCurve(canvas, size);
  }

  void _drawHorizontalLines(Canvas canvas, Size size) {
    final horizontalLinesPaint = Paint()
      ..color = CustomColors.purpleMegaDark
      ..strokeWidth = dp(1);

    final verticalInterval = (size.height - _verticalLinesPadding * 2) / 6;
    for (int i = 0; i < 7; i++) {
      final y = verticalInterval * i + _verticalLinesPadding;
      final p1 = Offset(_horizontalLinesPadding, y);
      final p2 = Offset(size.width - _horizontalLinesPadding, y);
      canvas.drawLine(p1, p2, horizontalLinesPaint);
    }
  }

  Offset _getPointPositionByMood(int index, double mood, Size size) {
    final horizontalPointsPadding = _horizontalLinesPadding + dp(5);
    final horizontalInterval = (size.width - horizontalPointsPadding * 2) / 6;
    final verticalInterval = (size.height - _verticalLinesPadding * 2) / 6;
    final x = horizontalPointsPadding + index * horizontalInterval;
    final y = _verticalLinesPadding + (7 - mood) * verticalInterval;
    return Offset(x, y);
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
      ..strokeWidth = dp(3)
      ..shader = gradientShader;

    final moodColorsGradientFillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradientShader;

    List<Offset> curvePoints = [];
    for (var i = 0; i < 7; i++) {
      if (averageDailyMoodForWeek[i] != null) {
        final mood = averageDailyMoodForWeek[i].toDouble();
        final p = _getPointPositionByMood(i, mood, size);
        curvePoints.add(p);
        canvas.drawCircle(p, dp(4), moodColorsGradientFillPaint);
      }
    }

    final path = Path();
    for (int i = 0; i < curvePoints.length - 1; i++) {
      final p = curvePoints[i];
      final p2 = curvePoints[i + 1];
      path.moveTo(p.dx, p.dy);
      path.lineTo(p2.dx, p2.dy);
    }

    canvas.drawPath(path, moodColorsGradientStrokePaint);
  }

  @override
  bool shouldRepaint(covariant MoodChartPainter oldDelegate) {
    for(var i = 0; i < averageDailyMoodForWeek.length; i++) {
      final oldAverageDailyMood = oldDelegate.averageDailyMoodForWeek[i];
      final averageDailyMood = averageDailyMoodForWeek[i];
      if (oldAverageDailyMood != averageDailyMood) {
        return true;
      }
    }
    return false;
  }
}
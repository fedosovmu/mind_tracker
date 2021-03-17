import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';
import 'package:flutter/foundation.dart';


class MoodChart extends StatelessWidget {
  static final double _height = dp(200);

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now().date;
    final DateTime weekAgo = today.subtract(Duration(days: 7));
    return Center(
      child: Container(
        height: _height,
        width: double.infinity,
        child: Consumer<MoodAssessmentsProvider> (
          builder: (context, moodAssessmentsProvider, child) {
            return CustomPaint(
              painter: MoodChartPainter(
                  moodAssessmentsForWeek: moodAssessmentsProvider.getMoodAssessmentForPeriod(
                      startDate: today,
                      endDate: weekAgo
                  )
              ),
            );
          }
        )
      ),
    );
  }
}

class MoodChartPainter extends CustomPainter {
  final List<MoodAssessment> moodAssessmentsForWeek;

  MoodChartPainter({this.moodAssessmentsForWeek});

  @override
  void paint(Canvas canvas, Size size) {
    _drawHorizontalLines(canvas, size);
    _drawDatePoints(canvas, size);
  }

  double _getMoodHeight(Size size, int mood) {
    return (size.height / 6) * (mood - 1);
  }

  void _drawHorizontalLines (Canvas canvas, Size size) {
    final Paint horizontalLinesPaint = Paint()
      ..color = CustomColors.purpleMegaDark
      ..strokeWidth = dp(1);

    final verticalInterval = (size.height) / 6;
    for (int mood = 1; mood <= 7; mood++) {
      final y = _getMoodHeight(size, mood);
      final p1 = Offset(0, y);
      final p2 = Offset(size.width, y);
      canvas.drawLine(p1, p2, horizontalLinesPaint);
    }
  }

  double _getDateCenter(Size size, int dateIndex) {
    final double dateInterval = size.width / 7;
    return dateInterval * (dateIndex + 0.5);
  }

  void _drawDatePoints (Canvas canvas, Size size) {
    final gradientShader = ui.Gradient.linear(
        Offset(0, size.height),
        Offset(0, 0),
        List.generate(CustomColors.moods.length, (index) => CustomColors.moods[index+1]),
        List.generate(CustomColors.moods.length, (index) => (index / (CustomColors.moods.length - 1)))
    );

    final moodColorsGradientFillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradientShader;

    final moodColorsGradientStrokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = dp(2)
      ..shader = gradientShader;

    List<Offset> curvePoints = [];
    for (var dateIndex = 0; dateIndex < 7; dateIndex++) {
        final mood = dateIndex + 1;
        final y = _getMoodHeight(size, mood);
        final x = _getDateCenter(size, dateIndex);
        final p = Offset(x, y);
        canvas.drawCircle(p, dp(3), moodColorsGradientFillPaint);
        curvePoints.add(p);
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
  bool shouldRepaint(covariant MoodChartPainter old) {
    return !listEquals(old.moodAssessmentsForWeek, moodAssessmentsForWeek);
  }
}
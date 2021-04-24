import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';
import 'package:flutter/foundation.dart';


class Chart extends StatelessWidget {
  static final double _height = dp(200);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      child: Center(
        child: Container(
          height: _height,
          width: double.infinity,
          child: Consumer<MoodAssessmentsProvider> (
            builder: (context, moodAssessmentsProvider, child) {
              return CustomPaint(
                painter: _ChartPainter(
                    normalizedPoints: List.generate(28, (index) {
                      final int mood = (index / 4 + 0.5).round() % 4 + 2;
                      final pos = 1 / 27 * index;
                      return _NormalizedPoint(mood * 1.0, pos);
                    })
                ),
              );
            }
          )
        ),
      ),
    );
  }
}


class _ChartPainter extends CustomPainter {
  final List<_NormalizedPoint> normalizedPoints;

  _ChartPainter({@required this.normalizedPoints});

  @override
  void paint(Canvas canvas, Size size) {
    _drawHorizontalLines(canvas, size);
    _drawMoodChart(canvas, size);
  }

  void _drawHorizontalLines (Canvas canvas, Size size) {
    final Paint horizontalLinesPaint = Paint()
      ..color = CustomColors.purpleMegaDark
      ..strokeWidth = dp(1);

    final verticalInterval = (size.height) / 6;
    for (int i = 0; i < 7; i++) {
      final y = verticalInterval * i;
      final p1 = Offset(0, y);
      final p2 = Offset(size.width, y);
      canvas.drawLine(p1, p2, horizontalLinesPaint);
    }
  }

  Offset _getChartPoint(Size size, _NormalizedPoint normalizedPoint) {
    final x = size.width * normalizedPoint.normalizedPosition;
    final y = (size.height / 6) * (7 - normalizedPoint.mood);
    return Offset(x, y);
  }

  void _drawMoodChart (Canvas canvas, Size size) {
    final Shader gradientShader = ui.Gradient.linear(
        Offset(0, size.height),
        Offset(0, 0),
        List.generate(CustomColors.moods.length, (index) => CustomColors.moods[index+1]),
        List.generate(CustomColors.moods.length, (index) => (index / (CustomColors.moods.length - 1)))
    );

    final Paint moodColorsGradientFillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradientShader;

    final Paint moodColorsGradientStrokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = dp(2)
      ..shader = gradientShader;

    List<Offset> curvePoints = [];
    for (int i = 0; i < normalizedPoints.length; i++) {
      final chartPoint = _getChartPoint(size, normalizedPoints[i]);
      curvePoints.add(chartPoint);
    }

    final path = Path();
    for (int i = 0; i < curvePoints.length - 1; i++) {
      final p = curvePoints[i];
      final p2 = curvePoints[i + 1];
      path.moveTo(p.dx, p.dy);
      path.lineTo(p2.dx, p2.dy);
      if (i == 0) {
        canvas.drawCircle(p, dp(3), moodColorsGradientFillPaint);
      }
      canvas.drawCircle(p2, dp(3), moodColorsGradientFillPaint);
    }

    canvas.drawPath(path, moodColorsGradientStrokePaint);
  }

  @override
  bool shouldRepaint(covariant _ChartPainter old) {
    return !listEquals(old.normalizedPoints, normalizedPoints);
  }
}




class ChartPointPositionsCalculator {
  final MoodAssessmentsProvider moodAssessmentsProvider;

  ChartPointPositionsCalculator(this.moodAssessmentsProvider);

  List<double> getAverageMoodForDay(List<MoodAssessment> moodAssessmentsForDay, int averageValuesCount) {
    return [moodAssessmentsForDay[0].mood as double]; //TODO: implement this function
  }


  List<_NormalizedPoint> getChartPointsForWeek() {
    final today = DateTime.now().date;
    final moodAssessmentsForWeek = moodAssessmentsProvider.getMoodAssessmentForPeriod(
        startDate: today.subtract(Duration(days: DateTime.daysPerWeek)),
        endDate: today
    );
    //const double intervalSize = 1 / DateTime.daysPerWeek;
    final List<_NormalizedPoint> points = [];
    for (var i = 0; i < DateTime.daysPerWeek; i++) {
      final date = today.subtract(Duration(days: DateTime.daysPerWeek - 1 - i));
      final moodAssessmentsForDay = moodAssessmentsForWeek.where(
              (moodAssessment) => moodAssessment.date == date);
      final averageMoodForDay = getAverageMoodForDay(moodAssessmentsForDay, 4);
    }
  }

  List<_NormalizedPoint> getChartPointsForMonth() {

  }
}


class _NormalizedPoint {
  final double mood;
  final double normalizedPosition;

  _NormalizedPoint(this.mood, this.normalizedPosition);
}
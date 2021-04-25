import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';


class Chart extends StatelessWidget {
  static final double _height = dp(200);
  final DateTime startDate;
  final DateTime endDate;

  Chart({@required this.startDate, @required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dp(16+8)),
      child: Center(
        child: Container(
          height: _height,
          width: double.infinity,
          child: Consumer<MoodAssessmentsProvider> (
            builder: (context, moodAssessmentsProvider, child) {
              final chartPointPositionsCalculator = _ChartPointPositionsCalculator(moodAssessmentsProvider);
              return CustomPaint(
                painter: _ChartPainter(
                    normalizedPoints: chartPointPositionsCalculator.getChartPointsForPeriod(startDate, endDate)
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
      ..strokeWidth = dp(1)
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
      final circleSize = dp(2);
      if (i == 0) {
        canvas.drawCircle(p, circleSize, moodColorsGradientFillPaint);
      }
      canvas.drawCircle(p2, circleSize, moodColorsGradientFillPaint);
    }

    canvas.drawPath(path, moodColorsGradientStrokePaint);
  }

  @override
  bool shouldRepaint(covariant _ChartPainter old) {
    return !listEquals(old.normalizedPoints, normalizedPoints);
  }
}




class _ChartPointPositionsCalculator {
  final MoodAssessmentsProvider moodAssessmentsProvider;

  _ChartPointPositionsCalculator(this.moodAssessmentsProvider);

  double _getAverageMood(List<MoodAssessment> moodAssessmentsForDay) {
    double moodSum = 0;
    for (var i = 0; i < moodAssessmentsForDay.length; i++) {
      moodSum += moodAssessmentsForDay[i].mood;
    }
    return moodSum / moodAssessmentsForDay.length;
  }
  
  List<double> _getAverageMoods(List<MoodAssessment> moodAssessments, int averageValuesCount) {
    if (moodAssessments.length <= averageValuesCount) {
      return moodAssessments.map((moodAssessment) => moodAssessment.mood.toDouble()).toList();
    } else if (averageValuesCount == 1) {
      return [_getAverageMood(moodAssessments)];
    } else {
      List<double> averageMoods = [];
      final moodAssessmentsPerPoint = moodAssessments.length / averageValuesCount;
      List<MoodAssessment> moodAssessmentsForPeriod = [];
      var groupNumber = 1;
      for (var i = 1; i <= moodAssessments.length; i++) {
        if (i > moodAssessmentsPerPoint * groupNumber) {
          groupNumber++;
          averageMoods.add(_getAverageMood(moodAssessmentsForPeriod));
          moodAssessmentsForPeriod = [];
        }
        moodAssessmentsForPeriod.add(moodAssessments[i - 1]);
      }
      averageMoods.add(_getAverageMood(moodAssessmentsForPeriod));
      return averageMoods;
    }
  }


  List<_NormalizedPoint> getChartPointsForPeriod(DateTime startDate, DateTime endDate) {
    //final today = DateTime.now().date;
    final int daysCount = endDate.difference(startDate).inDays;
    final List<_NormalizedPoint> pointsForWeek = [];
    for (var i = 0; i < daysCount; i++) {
      final date = endDate.subtract(Duration(days: daysCount - 1 - i));
      final moodAssessmentsForDay = moodAssessmentsProvider.getMoodAssessmentsForDate(date).toList();
      final int pointsCountPerDay = (28 / daysCount).round();
      final averageMoodsForDay = _getAverageMoods(moodAssessmentsForDay, i == (daysCount - 1) ? 1 : pointsCountPerDay);
      for (var j = 0; j < averageMoodsForDay.length; j++) {
        final mood = averageMoodsForDay[j];
        final double intervalSize = 1 / (daysCount - 1);
        final position = intervalSize * i + intervalSize * (j / averageMoodsForDay.length);
        final point = _NormalizedPoint(mood, position);
        pointsForWeek.add(point);
      }
    }
    return pointsForWeek;
  }
}


class _NormalizedPoint {
  final double mood;
  final double normalizedPosition;

  _NormalizedPoint(this.mood, this.normalizedPosition);
}
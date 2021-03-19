import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';


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
                      startDate: weekAgo,
                      endDate: today
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

  MoodChartPainter({@required this.moodAssessmentsForWeek});

  @override
  void paint(Canvas canvas, Size size) {
    _drawHorizontalLines(canvas, size);
    _drawMoodChart(canvas, size);
  }

  double _getMoodY(Size size, mood) {
    return (size.height / 6) * (7 - mood);
  }

  void _drawHorizontalLines (Canvas canvas, Size size) {
    final Paint horizontalLinesPaint = Paint()
      ..color = CustomColors.purpleMegaDark
      ..strokeWidth = dp(1);

    final verticalInterval = (size.height) / 6;
    for (int mood = 1; mood <= 7; mood++) {
      final y = _getMoodY(size, mood);
      final p1 = Offset(0, y);
      final p2 = Offset(size.width, y);
      canvas.drawLine(p1, p2, horizontalLinesPaint);
    }
  }

  double _getDateCenterX(Size size, int dateIndex) {
    final double dateInterval = size.width / 7;
    return dateInterval * (dateIndex + 0.5);
  }

  List<double> _getDateXPoints(Size size, int dateIndex, int pointsCount) {
    final double dateInterval = size.width / 7;
    final double dateCenterX = _getDateCenterX(size, dateIndex);
    final List<double> points = List.generate(pointsCount, (index) {
      final double distanceBetweenPoints = dateInterval / pointsCount;
      return (dateCenterX - dateInterval / 2) + (distanceBetweenPoints * (0.5 + index));
    });
    return points;
  }

  List<Offset> _getDatePoints(Size size, int dateIndex) {
    final DateTime today = DateTime.now().date;
    final DateTime date = today.subtract(Duration(days: (DateTime.daysPerWeek - 1) - (dateIndex)));
    final List<MoodAssessment> moodAssessmentsForDay = moodAssessmentsForWeek.where(
            (moodAssessment) => moodAssessment.date == date).toList();

    // TODO: delete this print
    print('MOOD CHART DATE: ${date.toStringDate()} ${moodAssessmentsForDay.map(
            (e) => '${e.mood} ${e.partOfDay.toShortString()}')}');

    if (moodAssessmentsForDay.isNotEmpty) {
      final moodAssessmentsForDayGroupedByPartOfDay = groupBy(moodAssessmentsForDay, (MoodAssessment moodAssessment) {
        return moodAssessment.partOfDay;
      });

      final List<double> averageMoodForAllExistingPartOfDays = [];
      moodAssessmentsForDayGroupedByPartOfDay.forEach((partOfDay, moodAssessmentsForPartOfDay) {
        int moodSum = 0;
        moodAssessmentsForPartOfDay.forEach((moodAssessment) { moodSum += moodAssessment.mood; });
        final double averageMoodForPartOfDay = moodSum / moodAssessmentsForPartOfDay.length;
        //TODO: delete this print
        //print('(${partOfDay.toShortString()}: $averageMoodForPartOfDay)');
        averageMoodForAllExistingPartOfDays.add(averageMoodForPartOfDay);
      });

      final List<Offset> points = [];
      final List<double> xPoints = _getDateXPoints(size, dateIndex, averageMoodForAllExistingPartOfDays.length);
      for (int i = 0; i < averageMoodForAllExistingPartOfDays.length; i++) {
        final double x = xPoints[i];
        final averageMoodForPartOfDay = averageMoodForAllExistingPartOfDays[i];
        final double y = _getMoodY(size, averageMoodForPartOfDay);
        final Offset p = Offset(x, y);
        points.add(p);
      }
      return points;
    } else {
      return const [];
    }
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
    for (int dateIndex = 0; dateIndex < DateTime.daysPerWeek; dateIndex++) {
      //TODO: delete this draw
      // draw test points
      //final int mood = dateIndex + 1;
      //final double y = _getMoodY(size, mood);
      //final double x = _getDateCenterX(size, dateIndex);
      //final Offset p = Offset(x, y);
      //curvePoints.add(p);

      final List<Offset> datePoints = _getDatePoints(size, dateIndex);
      curvePoints.addAll(datePoints);
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
  bool shouldRepaint(covariant MoodChartPainter old) {
    return !listEquals(old.moodAssessmentsForWeek, moodAssessmentsForWeek);
  }
}
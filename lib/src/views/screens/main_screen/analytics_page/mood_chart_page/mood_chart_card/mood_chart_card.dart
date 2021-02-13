import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/mood_chart_page/'
    'mood_chart_card/period_toggle_buttons.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MoodChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(20)),
      width: dp(327),
      height: dp(352),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
      child: Column(
        children: [
          PeriodToggleButtons(
            onPeriodChange: (int index) {
              print('Period was changed to $index');
            },
          ),
          Container(
            padding: EdgeInsets.only(top: dp(14), left: dp(16)),
            //color: Colors.blue,
            width: double.infinity,
            height: dp(40),
            child: Text(
              'Февраль',
              style: CustomTextStyles.basicH1Medium,
            ),
          ),
          MoodChart(),
          Expanded(
            child: _buildLables()
          )
        ],
      ),
    );
  }

  static const weekDayNames = ['Пн', 'Вт', 'Ср' , 'Чт' ,'Пт' ,'Сб' ,'Вс'];

  Widget _buildLables() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dp(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(7, (index) {
          final int day = index + DateTime.now().day - 6;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$day',
                style: CustomTextStyles.basic.copyWith(
                  color: CustomColors.purpleLight
                ),
              ),
              Text(
                '${weekDayNames[day % 7]}',
                style: CustomTextStyles.basic.copyWith(
                  color: CustomColors.purpleTextSecondary
                ),
              )
            ],
          );
        })
      ),
    );
  }
}

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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
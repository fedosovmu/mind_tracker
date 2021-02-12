import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/mood_chart_page/mood_chart_card/period_button.dart';


class PeriodToggleButtons extends StatefulWidget {
  final Function onPeriodChange;

  PeriodToggleButtons({this.onPeriodChange});

  @override
  _PeriodToggleButtonsState createState() => _PeriodToggleButtonsState();
}

class _PeriodToggleButtonsState extends State<PeriodToggleButtons> {
  int _selectedIndex = 0;
  static const _periodNames = ['Неделя', 'Месяц', 'Период'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dp(12), right: dp(12), top: dp(16)),
      height: dp(26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_periodNames.length, (index) {
          return PeriodButton(
              _periodNames[index],
              isPressed: index == _selectedIndex,
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                  print('Perion button $index was pressed');
                });
              }
          );
        }),
      ),
    );
  }
}
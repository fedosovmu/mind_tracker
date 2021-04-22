import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/period_buttons/period_button.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class PeriodToggleButtons extends StatefulWidget {
  static const _periodNames = ['Неделя', '2 Недели', 'Месяц', 'Период'];

  @override
  _PeriodToggleButtonsState createState() => _PeriodToggleButtonsState();
}

class _PeriodToggleButtonsState extends State<PeriodToggleButtons> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(PeriodToggleButtons._periodNames.length, (index) {
          return PeriodButton(
            title: PeriodToggleButtons._periodNames[index],
            isPressed: index == _selectedIndex,
            onPressed: () {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        }),
      ),
    );
  }
}

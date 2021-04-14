import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/mood_chart_page/period_buttons/period_button.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class PeriodToggleButtons extends StatelessWidget {
  static const _periodNames = ['Неделя', 'В работе', 'В работе'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: dp(16)),
      padding: EdgeInsets.symmetric(horizontal: dp(12)),
      height: dp(82),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: CustomBorderRadius(dp(16))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(_periodNames.length, (index) {
          return PeriodButton(
            title: _periodNames[index],
            isPressed: index == selectedIndex,
          );
        }),
      ),
    );
  }
}

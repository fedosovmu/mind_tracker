import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MoodChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: dp(20)),
      width: dp(327),
      height: dp(352),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
      child: Column(
        children: [
          _buildTabs()
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      color: Colors.red,
      width: dp(303),
      height: dp(26),
      child: Center(
        child: Text(
          'Неделя       Месяц       Период',
          style: CustomTextStyles.basic.copyWith(color: CustomColors.purpleLight),
        ),
      ),
    );
  }
}
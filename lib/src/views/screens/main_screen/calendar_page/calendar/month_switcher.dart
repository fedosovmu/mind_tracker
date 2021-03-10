import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'month_switch_button.dart';


class MonthSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      height: dp(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${Content.monthNames[now.month]} ${now.year}',
            style: CustomTextStyles.basicH1Medium,
          ),
          SizedBox(
            width: dp(32 + 31 + 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MonthSwitchButton(),
                MonthSwitchButton(isRight: true)
              ],
            ),
          )
        ],
      ),
    );
  }
}
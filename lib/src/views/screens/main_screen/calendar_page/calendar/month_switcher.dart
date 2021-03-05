import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'month_switch_button.dart';


class MonthSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: dp(3)),
      height: dp(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Февраль 2021',
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
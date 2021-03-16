import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'month_switch_button.dart';


class MonthSwitchButtons extends StatelessWidget {
  final Function onLeftArrowPressed;
  final Function onRightArrowPressed;

  MonthSwitchButtons ({@required this.onLeftArrowPressed, @required this.onRightArrowPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      height: dp(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '2021 Март',
            style: CustomTextStyles.basicH1Medium,
          ),
          SizedBox(
            width: dp(32 + 31 + 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MonthSwitchButton(onPressed: onLeftArrowPressed),
                MonthSwitchButton(onPressed: onRightArrowPressed, isRight: true)
              ],
            ),
          )
        ],
      ),
    );
  }
}
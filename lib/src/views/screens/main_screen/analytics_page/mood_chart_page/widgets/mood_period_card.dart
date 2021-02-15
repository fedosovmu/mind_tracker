import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MoodPeriodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(12)),
      padding: EdgeInsets.only(left: dp(50)),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: dp(56),
      decoration: BoxDecoration(
          color: CustomColors.purpleSuperDark,
          borderRadius: BorderRadius.all(Radius.circular(dp(16)))
      ),
      child: Text(
        '${DateTime.now().day} Февраля',
        style: CustomTextStyles.basic.copyWith(
            color: CustomColors.purpleLight
        ),
      ),
    );
  }
}
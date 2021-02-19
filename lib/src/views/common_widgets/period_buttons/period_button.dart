import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class PeriodButton extends StatelessWidget {
  final String title;
  final bool isPressed;

  PeriodButton({this.title, this.isPressed = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: dp(93),
        height: dp(50),
        child: Center(
          child: Text(
            title,
            style: CustomTextStyles.basic.copyWith(
                color: isPressed ? CustomColors.silverWhite : CustomColors.purpleLight
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: isPressed ? CustomColors.purpleMegaDark : CustomColors.purpleDark,
          borderRadius: BorderRadius.all(Radius.circular(dp(8)))
        ),
    );
  }
}
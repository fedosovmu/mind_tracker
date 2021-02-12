import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class PeriodButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isPressed;

  PeriodButton(this.title, {this.onPressed, this.isPressed = false});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        splashColor: Color(0x00),
        highlightColor: Color(0x00),
        color: isPressed ? CustomColors.purpleMegaDark : CustomColors.purpleDark,
        minWidth: dp(93),
        child: Text(
          title,
          style: CustomTextStyles.basic.copyWith(
              color: CustomColors.purpleLight
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(dp(8)))
        ),
        onPressed: onPressed
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class PeriodButton extends StatelessWidget {
  final String title;
  final bool isPressed;
  final Function onPressed;

  PeriodButton({@required this.title, this.isPressed = false, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: dp(76),
          height: dp(32),
          child: Center(
            child: Text(
              title,
              style: CustomTextStyles.caption.copyWith(
                  color: CustomColors.purpleLight
              ),
            ),
          ),
          decoration: ShapeDecoration(
            color: isPressed ? CustomColors.main : CustomColors.purpleSuperDark,
            shape: CustomBorderShape(dp(12)),
          ),
      ),
    );
  }
}
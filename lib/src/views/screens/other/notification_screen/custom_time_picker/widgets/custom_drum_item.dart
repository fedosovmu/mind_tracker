import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CustomDrumItem extends StatelessWidget {
  static final height = dp(60);
  final String text;
  final double opacity;

  CustomDrumItem(this.text, this.opacity);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Center(
          child: Text(
            text,
            style: CustomTextStyles.titleH1.copyWith(
              color: Color.lerp(
                  CustomColors.white,
                  CustomColors.purpleLight,
                  1 - opacity
              ).withOpacity(opacity),
              fontSize: dp(44 - 20 * (1 - opacity)),
            ),
          )
      ),
    );
  }
}
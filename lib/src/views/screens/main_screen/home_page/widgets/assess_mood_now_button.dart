import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class AssessMoodNowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        print('Press assess mood now button ');
        Navigator.pushNamed(context, '/moodAssessment/now');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/ui/plus_in_circle.png',
            width: dp(20),
          ),
          SizedBox(
            width: dp(10),
          ),
          Text(
            'Настроение сейчас',
            style: CustomTextStyles.basic
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
      height: dp(48),
      color: CustomColors.main,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(dp(12)))
      ),
    );
  }
}
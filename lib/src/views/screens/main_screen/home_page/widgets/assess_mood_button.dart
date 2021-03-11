import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class AssessMoodButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        print('Assess mood now button pressed');
        Navigator.pushNamed(context, '/moodAssessment');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/plus_in_circle.png',
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
      height: dp(51),
      color: CustomColors.main,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(dp(12)))
      ),
    );
  }
}
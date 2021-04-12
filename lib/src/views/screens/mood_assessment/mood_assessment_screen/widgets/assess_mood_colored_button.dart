import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class AssessMoodColoredButton extends StatelessWidget {
  final int currentMood;
  final Function onPressed;

  AssessMoodColoredButton({@required this.currentMood, @required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(56),
      width: double.infinity,
      padding: EdgeInsets.only(left: dp(16), right: dp(16)),
      child: SizedBox(
        height: dp(56),
        width: double.infinity,
        child: FlatButton(
          onPressed: this.onPressed,
          child: Text(
            'Оценить',
            style: CustomTextStyles.buttonMedium,
          ),
          color: CustomColors.moods[currentMood],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(dp(16)))
          ),
        ),
      ),
    );
  }
}
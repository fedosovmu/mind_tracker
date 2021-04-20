import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CustomTextButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  CustomTextButton({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      //splashColor: Colors.transparent,
      //highlightColor: Colors.transparent,
        onPressed: onPressed,
        minWidth: double.infinity,
        height: dp(56),
        child: Text(
          title,
          style: CustomTextStyles.buttonMedium.copyWith(
              color: CustomColors.purpleLight
          ),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MainButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  MainButton({@required this.title, @required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: CustomTextStyles.buttonMedium,
        ),
        height: dp(56),
        color: CustomColors.main,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(dp(12)))
        ),
    );
  }
}
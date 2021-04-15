import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class StandardButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  StandardButton({@required this.title, @required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: CustomTextStyles.buttonMedium,
        ),
        height: dp(56),
        minWidth: double.infinity,
        color: CustomColors.main,
        shape: RoundedRectangleBorder(
          borderRadius: CustomBorderRadius(dp(16))
        ),
    );
  }
}
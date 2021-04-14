import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class AddButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  AddButton(this.title, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: dp(156),
      height: dp(56),
      color: CustomColors.purpleSuperDark,
      shape: RoundedRectangleBorder(
        borderRadius: CustomBorderRadius(dp(16))
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(CustomIconPaths.plus, height: dp(24)),
          SizedBox(width: dp(4)),
          Text(
            title,
            style: CustomTextStyles.basic,
          ),
          SizedBox(width: dp(8)) // to center align
        ],
      ),
    );
  }
}
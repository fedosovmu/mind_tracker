import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class EditCommentButton extends StatelessWidget {
  final Function onPressed;

  EditCommentButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: dp(156),
      height: dp(56),
      color: CustomColors.purpleSuperDark,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(dp(16)))
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: dp(32),
            height: dp(32),
            decoration: BoxDecoration(
                color: CustomColors.purpleDark,
                shape: BoxShape.circle
            ),
            child: Center(
              child: Image.asset(
                CustomIconPaths.edit,
                width: dp(14)
              ),
            ),
          ),
          SizedBox(width: dp(8)),
          Text(
            'Комментарий',
            style: CustomTextStyles.caption.copyWith(
                color: CustomColors.purpleSilverWhite
            ),
          ),
        ],
      ),
    );
  }
}
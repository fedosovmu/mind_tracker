import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class AddButton extends StatelessWidget {
  final String title;

  AddButton(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp(156),
      height: dp(56),
      decoration: BoxDecoration(
          color: CustomColors.purpleSuperDark,
          borderRadius: BorderRadius.all(Radius.circular(dp(16)))
      ),
      child: Row(
        children: [
          Text(
            title,
            style: CustomTextStyles.basic,
          )
        ],
      ),
    );
  }
}
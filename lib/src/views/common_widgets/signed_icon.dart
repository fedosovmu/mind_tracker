import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import '../utils/metrics.dart';


class SignedIcon extends StatelessWidget {
  final Widget icon;
  final String text;

  SignedIcon({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      padding: EdgeInsets.only(top: dp(8)),
      child: IconButton(
        padding: EdgeInsets.zero,
        splashRadius: dp(44),
        iconSize: dp(80),
        icon: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              height: dp(4)
            ),
            Text(
              text,
              style: CustomTextStyles.basic.copyWith(
                  color: CustomColors.silverWhite),
            ),
          ],
        ),
        onPressed: () { print('Bottom menu pressed'); },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/custom_text_styles.dart';
import '../utils/metrics.dart';


class SignedIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: dp(8)),
      child: IconButton(
        padding: EdgeInsets.zero,
        splashRadius: dp(44),
        iconSize: dp(60),
        icon: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/home.png',
              color: CustomColors.purpleTextSecondary,
              width: dp(24),
              height: dp(24),
            ),
            Text(
              'Главный',
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
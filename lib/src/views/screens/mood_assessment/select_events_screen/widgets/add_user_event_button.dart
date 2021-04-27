import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class AddUserEventButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Add user event button pressed');
        Navigator.of(context).pushNamed('/createUserEventTitle');
      },
      child: Column(
        children: [
          Container(
            height: dp(63),
            child: DottedBorder(
              borderType: BorderType.Circle,
              strokeWidth: dp(1),
              color: CustomColors.purpleWhite.withOpacity(0.32),
              dashPattern: [8, 4],
              child: Center(
                child: Image.asset(
                  CustomIconPaths.plus,
                  color: CustomColors.purpleWhite,
                  width: dp(24),
                  height: dp(24),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: CustomColors.purpleSuperDark.withOpacity(0.32),
              shape: BoxShape.circle
            ),
          ),
          SizedBox(height: dp(8)),
          Expanded(
            child: Text(
              'Добавить событие',
              style: CustomTextStyles.caption.copyWith(
                color: CustomColors.purpleLight
              ),
              textAlign: TextAlign.center,
            )
          )
        ],
      ),
    );
  }
}
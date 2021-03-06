import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class EditSelectedEventsButton extends StatelessWidget {
  final int eventsCount;
  final Function onPressed;

  EditSelectedEventsButton({@required this.eventsCount, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: dp(156),
      height: dp(56),
      color: CustomColors.purpleSuperDark,
      shape: CustomBorderShape(dp(16)),
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
              child: Text(
                '+${eventsCount > 99 ? 99 : eventsCount}',
                style: CustomTextStyles.caption.copyWith(
                  color: CustomColors.purpleWhite
                ),
              ),
            ),
          ),
          SizedBox(width: dp(8)),
          Text(
            'События',
            style: CustomTextStyles.caption.copyWith(
              color: CustomColors.purpleWhite
            ),
          ),
        ],
      ),
    );
  }
}
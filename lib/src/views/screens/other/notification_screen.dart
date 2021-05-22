import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Напоминания',
        leading: CustomLeading(
          pathToIcon: CustomIconPaths.back,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(dp(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Выбери время для\n'
                    'напоминания',
                style: CustomTextStyles.titleH1.copyWith(
                  color: CustomColors.purpleWhite
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: dp(16)),
            Center(
              child: Text(
                'В это время тебе будут приходить уведомления,\n'
                    'с напоминанием оценить настроение',
                style: CustomTextStyles.basic.copyWith(
                  color: CustomColors.purpleMedium
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: dp(32)),
            Row(
              children: [
                NotificationTimeBox(selected: true),
                SizedBox(width: dp(8)),
                NotificationTimeBox(),
              ],
            )
          ],
        ),
      )
    );
  }
}


class NotificationTimeBox extends StatelessWidget {
  final bool selected;

  NotificationTimeBox({this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp(70+8),
      height: dp(86+8),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: dp(70),
              height: dp(86),
              decoration: BoxDecoration(
                color: selected ? CustomColors.main : CustomColors.purpleSuperDark,
                border: Border.all(
                  color: selected ? CustomColors.main : CustomColors.purpleMegaDark,
                  width: dp(1)
                ),
                borderRadius: CustomBorderRadius(dp(16))
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CrossInRedCircle()
          )
        ],
      ),
    );
  }
}


class CrossInRedCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Press red cross');
      },
      child: Container(
        width: dp(24),
        height: dp(24),
        decoration: BoxDecoration(
            color: CustomColors.red,
            shape: BoxShape.circle
        ),
        child: Center(
          child: Image.asset(
            CustomIconPaths.close,
            color: CustomColors.purpleDark,
            height: dp(16),
            width: dp(16),
          ),
        ),
      ),
    );
  }
}
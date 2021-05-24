import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/notification_time.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/widgets/notification_time_box.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
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
                NotificationTimeBox(NotificationTime(9, 0) ,selected: true),
                SizedBox(width: dp(8)),
                NotificationTimeBox(NotificationTime(13, 30)),
              ],
            ),
            SizedBox(height: dp(16)),
            Container(
              height: dp(200),
              width: double.infinity,
              decoration: ShapeDecoration(
                color: CustomColors.purpleSuperDark,
                shape: CustomBorderShape(dp(16)),
              ),
            ),
            Spacer(),
            StandardButton(
                title: 'Сохранить',
                onPressed: () {
                  print('Press save button');
                }
            )
          ],
        ),
      )
    );
  }
}
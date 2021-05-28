import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/notification_time.dart';
import 'package:mind_tracker/src/views/common_widgets/app_bar/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/app_bar/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/other/standard_button.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/custom_time_picker.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/custom_time_picker_controller.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/widgets/add_notification_button.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/widgets/notification_time_box.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timePickerController = CustomTimePickerController(
        initialTime: NotificationTime(10, 20)
    );
    timePickerController.addListener(() {
      print('Time changed: ${timePickerController.time}');
    });
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
                NotificationTimeBox(NotificationTime(9, 30) ,selected: true),
                SizedBox(width: dp(8)),
                NotificationTimeBox(NotificationTime(13, 50)),
                SizedBox(width: dp(8)),
                AddNotificationButton(
                  onPressed: () { print('Add new notification'); },
                )
              ],
            ),
            SizedBox(height: dp(16)),
            CustomTimePicker(
              controller: timePickerController,
            ),
            Spacer(),
            StandardButton(
                title: 'Готово',
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
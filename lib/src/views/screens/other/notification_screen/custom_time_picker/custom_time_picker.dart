import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/custom_time_picker_controller.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_drum.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CustomTimePicker extends StatelessWidget {
  CustomTimePickerController controller;

  CustomTimePicker({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(250),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomDrum(
            itemsCount: 24,
            initValue: controller.time.hours,
            onSelectedValueChanged: (hours) {
              controller.attachHours(hours);
            },
          ),
          Container(
            padding: EdgeInsets.only(bottom: dp(8)),
            child: Text(':',
              style: CustomTextStyles.titleH1.copyWith(
                fontSize: dp(44),
              ),
            ),
          ),
          CustomDrum(
            itemsCount: 60,
            initValue: controller.time.minutes,
            onSelectedValueChanged: (minutes) {
              controller.attachMinutes(minutes);
            },
          )
        ],
      )
    );
  }
}
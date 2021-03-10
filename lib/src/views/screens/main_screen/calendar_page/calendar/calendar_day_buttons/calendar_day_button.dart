import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'calendar_day_button_mood_spheres.dart';
import 'package:mind_tracker/src/business_logic/services/dateParser.dart';


class CalendarDayButton extends StatelessWidget {
  final DateTime date;

  CalendarDayButton({@required this.date});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isSelected = (date == now.date);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${date.day}',
            style: CustomTextStyles.basicH1Medium,
          ),
          CalendarDayButtonMoodSpheres(date)
        ],
      ),
      decoration: BoxDecoration(
          color: isSelected ? CustomColors.purpleMegaDark : null,
          borderRadius: BorderRadius.all(Radius.circular(dp(8)))
      ),
    );
  }
}
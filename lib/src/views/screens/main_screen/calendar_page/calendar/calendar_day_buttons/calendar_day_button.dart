import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'calendar_day_button_mood_spheres.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class CalendarDayButton extends StatelessWidget {
  final DateTime date;
  final Function onPressed;
  final bool isSelected;

  CalendarDayButton({@required this.date, @required this.onPressed, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().date;
    final isToday = (date == today);
    return InkWell(
      onTap: onPressed,
      child: Container(
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
              color: isToday ? CustomColors.purpleMegaDark : null,
              borderRadius: CustomBorderRadius(dp(12)),
              border: isSelected ? Border.all(width: dp(2), color: CustomColors.main.withAlpha(0xA3)) : null
          ),
      ),
    );
  }
}
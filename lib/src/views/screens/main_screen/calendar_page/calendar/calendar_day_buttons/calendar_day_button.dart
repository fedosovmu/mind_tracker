import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'calendar_day_button_mood_spheres.dart';


class CalendarDayButton extends StatelessWidget {
  final int day;
  final bool isSelected;

  CalendarDayButton({@required this.day, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$day',
            style: CustomTextStyles.basicH1Medium,
          ),
          CalendarDayButtonMoodSpheres()
        ],
      ),
      decoration: BoxDecoration(
          color: isSelected ? CustomColors.purpleMegaDark : null,
          borderRadius: BorderRadius.all(Radius.circular(dp(8)))
      ),
    );
  }
}
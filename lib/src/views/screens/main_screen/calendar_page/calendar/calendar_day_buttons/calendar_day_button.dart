import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/calendar_page/calendar/calendar_day_buttons/calendar_day_button_events_and_note_marks.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'calendar_day_button_mood_spheres.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class CalendarDayButton extends StatelessWidget {
  final DateTime date;
  final Function onPressed;
  final bool selected;

  CalendarDayButton({@required this.date, @required this.onPressed, this.selected = false});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().date;
    final isToday = (date == today);
    final isFuture = date.isAfter(today);
    return InkWell(
      onTap: isFuture ? null : onPressed,
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${date.day}',
                style: CustomTextStyles.basicH1Medium.copyWith(
                  color: isFuture ? CustomColors.purpleMedium : CustomColors.white
                ),
              ),
              CalendarDayButtonMoodSpheres(date),
              SizedBox(height: dp(2)),
              CalendarDayButtonEventsAndNoteMarks(date),
            ],
          ),
          decoration: BoxDecoration(
              color: isToday ? CustomColors.purpleMegaDark : null,
              borderRadius: BorderRadius.all(Radius.circular(dp(12))), //TODO: edit this radius
              border: selected ? Border.all(width: dp(2), color: CustomColors.main.withAlpha(0xA3)) : null
          ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import '../../../../utils/metrics.dart';


class MoodAssessmentCard extends StatelessWidget {
  final MoodAssessment moodAssessment;

  MoodAssessmentCard (this.moodAssessment);

  static String _getTimeString(BuildContext context, DateTime time) {
    final is24HourFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    if (is24HourFormat) {
      return DateFormat('Hm').format(time);
    } else {
      return DateFormat('jm').format(time);
    }
  }

  static String _getPartOfDayAndTimeString (BuildContext context, moodAssessment) {
    final partOfDayWord = Content.partOfDayNames[moodAssessment.partOfDay];
    final timeString = moodAssessment.time != null ? '  |  ${_getTimeString(context, moodAssessment.time)}' : '';
    return partOfDayWord + timeString;
  }

  static _getEventWord (int eventsNumber) {
    if ((eventsNumber % 10) == 1) {
      return 'Событие';
    } else if ((eventsNumber % 10) > 1 && (eventsNumber % 10) <= 4) {
      return 'События';
    } else {
      return 'Событий';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
      padding: EdgeInsets.only(top: dp(16), left: dp(24), bottom: dp(14)),
      alignment: Alignment.topLeft,
      width: double.infinity,
      height: dp(136),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: dp(41),
              child: Text(
                _getPartOfDayAndTimeString(context, moodAssessment),
                style: CustomTextStyles.basic.copyWith(color: CustomColors.purpleLight),
              ),
            ),
            Container(
              height: dp(41),
              child: Text(
                Content.moodNames[moodAssessment.mood],
                style: CustomTextStyles.titleH1,
              ),
            ),
            Expanded(
              child: Container(
                //color: Colors.blue,
                child: Row(
                  children: [
                    Container(
                      width: dp(24),
                      height: dp(24),
                      padding: EdgeInsets.only(left: dp(8.5), top: dp(4)),
                      child: Text(
                        '${moodAssessment.mood}',
                        style: CustomTextStyles.basic.copyWith(color: CustomColors.purpleLight),
                      ),
                      decoration: BoxDecoration(
                        color: CustomColors.purpleDark,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: dp(8),
                    ),
                    Text(
                      _getEventWord(moodAssessment.mood),
                      style: CustomTextStyles.basic.copyWith(color: CustomColors.purpleLight),
                    ),
                  ],
                ),
              ),
            )
          ]
      ),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
    );
  }
}
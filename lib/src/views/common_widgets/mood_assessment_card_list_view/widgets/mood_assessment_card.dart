import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';

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
    if ((eventsNumber % 10) == 1 && (eventsNumber < 10 || eventsNumber > 20)) {
      return 'Событие';
    } else if ((eventsNumber % 10) > 1 && (eventsNumber % 10) <= 4) {
      return 'События';
    } else {
      return 'Событий';
    }
  }

  List<Widget> _buildCommentIcon () {
    if (moodAssessment.comment != null) {
      return [
        Container(
          width: dp(24),
          height: dp(24),
          child: Center(
            child: Image.asset(
              CustomIconPaths.comment,
              color: CustomColors.purpleMedium,
              width: dp(16),
              height: dp(16),
            ),
          ),
          decoration: BoxDecoration(
            color: CustomColors.purpleDark,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: dp(8))
      ];
    } else {
      return [];
    }
  }

  List<Widget> _buildEventIconAndText() {
    if (moodAssessment.events != null) {
      final int eventsCount = moodAssessment.events.length;
      var leftPaddingInDp = 8.5;
      var topPaddingInDp = 4;
      var eventsNumberText = '${eventsCount}';
      var eventsText = _getEventWord(eventsCount);
      if (eventsCount > 9) {
        leftPaddingInDp = 5;
        topPaddingInDp = 3;
        eventsNumberText = '∞';
      }
      return [
        Container(
          width: dp(24),
          height: dp(24),
          padding: EdgeInsets.only(left: dp(leftPaddingInDp), top: dp(topPaddingInDp)),
          child: Text(
            eventsNumberText,
            style: CustomTextStyles.basic.copyWith(color: CustomColors.purpleMedium),
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
          eventsText,
          style: CustomTextStyles.basic.copyWith(color: CustomColors.purpleMedium),
        ),
      ];
    } else {
      return [];
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: dp(41),
                child: Text(
                  _getPartOfDayAndTimeString(context, moodAssessment),
                  style: CustomTextStyles.basic.copyWith(
                      color: CustomColors.purpleMedium
                  ),
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
                  child: Row(
                    children: [
                      ..._buildCommentIcon(),
                      ..._buildEventIconAndText()
                    ],
                  ),
                ),
              )
            ]
          ),
          Image.asset(
            CustomIconPaths.arrowRight,
            color: CustomColors.purpleMedium,
            width: dp(32),
            height: dp(32),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: BorderRadius.all(Radius.elliptical(16, 16)),
      ),
    );
  }
}
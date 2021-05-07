import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class MoodAssessmentCard extends StatelessWidget {
  final MoodAssessment moodAssessment;

  MoodAssessmentCard (this.moodAssessment);

  static String _getPartOfDayAndTimeString (BuildContext context, moodAssessment) {
    final partOfDayWord = Content.partOfDayNames[moodAssessment.partOfDay];
    final timeString = moodAssessment.time != null ? '  |  ${Content.getTimeString(context, moodAssessment.time)}' : '';
    return partOfDayWord + timeString;
  }

  Widget _buildNoteAndEventIconsString() {
    if (moodAssessment.events != null || moodAssessment.note != null) {
      return Row (
          children: [
            ..._buildEventIcons(),
            ..._buildNoteIcon(),
          ]
      );
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Нет событий',
          style: CustomTextStyles.basic.copyWith(
            color: CustomColors.purpleMedium
          ),
        ),
      );
    }
  }

  List<Widget> _buildNoteIcon () {
    if (moodAssessment.note != null) {
      return [
        NoteIconInCircle()
      ];
    } else {
      return [];
    }
  }


  List<Widget> _buildEventIcons() {
    if (moodAssessment.events != null) {
      final maxDisplayedEvents = moodAssessment.note != null ? 3 : 4;
      final int eventsCount = moodAssessment.events.length;
      final int displayedEventsCount = maxDisplayedEvents + 1 >= eventsCount ? eventsCount : maxDisplayedEvents;
      final int invisibleEventsCount = maxDisplayedEvents + 1 >= eventsCount ? 0 : eventsCount - maxDisplayedEvents;

      final List<Widget> eventIcons = [];
      for (var i = 0; i < displayedEventsCount; i++) {
        eventIcons.add(EventIconInCircle(moodAssessment.events[i]));
        eventIcons.add(SizedBox(width: dp(8)));
      }

      if (invisibleEventsCount > 0) {
        eventIcons.add(NumberWithPlusInCircle(invisibleEventsCount));
        eventIcons.add(SizedBox(width: dp(8)));
      }

      return eventIcons;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
      padding: EdgeInsets.only(top: dp(16), left: dp(24), bottom: dp(16)),
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
                  child: _buildNoteAndEventIconsString(),
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


class NumberWithPlusInCircle extends StatelessWidget {
  final int number;

  NumberWithPlusInCircle(this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp(24),
      height: dp(24),
      child: Center(
        child: Text(
          '+$number',
          style: CustomTextStyles.caption.copyWith(
            color: CustomColors.purpleMedium
          )
        )
      ),
      decoration: BoxDecoration(
        color: CustomColors.purpleDark,
        shape: BoxShape.circle,
      ),
    );
  }
}


class EventIconInCircle extends StatelessWidget {
  final Event event;
  
  EventIconInCircle(this.event);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp(24),
      height: dp(24),
      child: Center(
        child: Image.asset(
          CustomIconPaths.eventIcons[event.icon],
          color: CustomColors.purpleLight,
          width: dp(16),
          height: dp(16),
        ),
      ),
      decoration: BoxDecoration(
        color: CustomColors.purpleDark,
        shape: BoxShape.circle,
      ),
    );
  }
}


class NoteIconInCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp(24),
      height: dp(24),
      child: Center(
        child: Image.asset(
          CustomIconPaths.note,
          color: CustomColors.purpleLight,
          width: dp(16),
          height: dp(16),
        ),
      ),
      decoration: BoxDecoration(
        color: CustomColors.purpleDark,
        shape: BoxShape.circle,
      ),
    );
  }
}
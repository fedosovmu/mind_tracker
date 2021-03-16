import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';


class CalendarDayButtonMoodSpheres extends StatelessWidget {
  static const _maxMoodSpheresCount = 5;
  final DateTime date;

  CalendarDayButtonMoodSpheres(this.date);

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodAssessmentsProvider>(
        builder: (context, moodAssessmentProvider, child) {
          final moodAssessmentsForDay = moodAssessmentProvider.getMoodAssessmentsForDate(date);
          List<MoodAssessment> moodAssessmentsToShow = [];
          if (moodAssessmentsForDay.length <= _maxMoodSpheresCount) {
            moodAssessmentsToShow = moodAssessmentsForDay;
          } else {
            final moodAssessmentsForPartsOfDay = List.generate(PartOfDay.values.length, (index) {
              return moodAssessmentsForDay.where((element) => element.partOfDay == PartOfDay.values[index]);
            });
            for (var i = 0; moodAssessmentsToShow.length < _maxMoodSpheresCount; i++) {
              for (var moodAssessmentsForPartOfDay in moodAssessmentsForPartsOfDay) {
                if (moodAssessmentsForPartOfDay.length >= i + 1) {
                  moodAssessmentsToShow.add(moodAssessmentsForPartOfDay.toList()[i]);
                  if (moodAssessmentsToShow.length >= 4) break;
                }
              }
            }
            moodAssessmentsToShow.sort();
          }
          final moodSpheresCount = moodAssessmentsToShow.length;
          if (moodSpheresCount == 0) {
            return SizedBox(height: dp(4));
          }
          final List<Widget> moodSphereWidgets = List.generate(moodSpheresCount, (index) {
            return Container(
              width: dp(4),
              height: dp(4),
              decoration: BoxDecoration(
                  color: CustomColors.moods[moodAssessmentsToShow[index].mood],
                  shape: BoxShape.circle
              ),
            );
          });
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(moodSphereWidgets.length * 2 - 1, (index) {
                if (index % 2 == 0) {
                  return moodSphereWidgets[(index / 2).round()]; // moodSphereWidget
                } else {
                  return SizedBox(width: dp(2)); // whiteSpace
                }
              })
          );
        }
    );
  }
}
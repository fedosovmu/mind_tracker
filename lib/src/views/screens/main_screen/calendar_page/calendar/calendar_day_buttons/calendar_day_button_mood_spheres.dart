import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';


class CalendarDayButtonMoodSpheres extends StatelessWidget {
  final DateTime date;

  CalendarDayButtonMoodSpheres(this.date);

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodAssessmentsProvider>(
        builder: (context, moodAssessmentProvider, child) {
          final moodAssessmentsForDay = moodAssessmentProvider.getMoodAssessmentsForDate(date);
          List<int> moodSpheresValues = [];
          const maxMoodSpheresCount = 4;
          if (moodAssessmentsForDay.length <= maxMoodSpheresCount) {
            moodSpheresValues = moodAssessmentsForDay.map((e) => e.mood).toList();
          } else {
            for (var partOfDay in PartOfDay.values) {
              final moodAssessmentsForPartOfDay = moodAssessmentsForDay.where(
                      (element) => element.partOfDay == partOfDay);
              if (moodAssessmentsForPartOfDay.isNotEmpty) {
                moodSpheresValues.add(moodAssessmentsForPartOfDay.first.mood);
              }
            }
          }
          final moodSpheresCount = moodSpheresValues.length;
          if (moodSpheresCount == 0) {
            return SizedBox(height: dp(4));
          }
          final List<Widget> moodSphereWidgets = List.generate(moodSpheresCount, (index) {
            return Container(
              width: dp(4),
              height: dp(4),
              decoration: BoxDecoration(
                  color: CustomColors.moods[moodSpheresValues[index]],
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
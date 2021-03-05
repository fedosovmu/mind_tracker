import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class CalendarDayButtonMoodSpheres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var moodSpheresCount = 3;
    if (moodSpheresCount == 0) {
      return SizedBox(height: dp(4));
    }

    var moodSpheres = List.generate(moodSpheresCount, (index) {
      return Container(
        width: dp(4),
        height: dp(4),
        decoration: BoxDecoration(
            color: CustomColors.moods[5],
            shape: BoxShape.circle
        ),
      );
    });

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(moodSpheres.length * 2 - 1, (index) {
          if (index % 2 == 0) {
            return moodSpheres[(index / 2).round()];
          } else {
            return SizedBox(width: dp(2));
          }
        })
    );
  }
}
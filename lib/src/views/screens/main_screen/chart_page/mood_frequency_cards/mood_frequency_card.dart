import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MoodFrequencyCard extends StatelessWidget {
  static final height = dp(90);
  static final width = dp(160);
  final int mood;
  final PartOfDay partOfDay;
  final int moodAssessmentsWithSameMoodCount;
  final int moodAssessmentsAllCount;

  MoodFrequencyCard({@required this.mood, @required this.partOfDay,
    @required this.moodAssessmentsWithSameMoodCount, @required this.moodAssessmentsAllCount});

  @override
  Widget build(BuildContext context) {
    final lineWidth = width - dp(16*2);
    final coloredLineWidth = lineWidth * (moodAssessmentsWithSameMoodCount / moodAssessmentsAllCount);
    return Container(
      height: height,
      width: width,
      decoration: ShapeDecoration(
        color: CustomColors.purpleSuperDark,
        shape: CustomBorderShape(dp(16))
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: dp(16), top: dp(16), right: dp(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Content.moodNames[mood],
                  style: CustomTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w500
                  ),
                ),
                Container(
                  height: dp(24),
                  width: dp(24),
                  decoration: BoxDecoration(
                    color: CustomColors.moods[mood],
                    shape: BoxShape.circle
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Content.partOfDayNames[partOfDay],
                  style: CustomTextStyles.caption,
                ),
                Row(
                  children: [
                    Text(
                      '$moodAssessmentsWithSameMoodCount',
                      style: CustomTextStyles.caption,
                    ),
                    Text(
                      '/$moodAssessmentsAllCount',
                      style: CustomTextStyles.caption.copyWith(
                        color: CustomColors.purpleMedium
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(8)),
            child: Container(
              alignment: Alignment.centerLeft,
              height: dp(4),
              width: double.infinity,
              decoration: BoxDecoration(
                color: CustomColors.purpleDark,
                borderRadius: BorderRadius.all(Radius.circular(dp(2)))
              ),
              child: Container(
                height: double.infinity,
                width: coloredLineWidth,
                decoration: BoxDecoration(
                    color: CustomColors.moods[mood],
                    borderRadius: BorderRadius.all(Radius.circular(dp(2)))
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
}
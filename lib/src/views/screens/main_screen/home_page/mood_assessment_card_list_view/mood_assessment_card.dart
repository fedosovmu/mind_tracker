import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import '../../../../utils/metrics.dart';


class MoodAssessmentCard extends StatelessWidget with Content {
  final MoodAssessment moodAssess;

  MoodAssessmentCard (this.moodAssess);

  @override
  Widget build(BuildContext context) {
    loadContent('moodAssessmentCard');
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(12)),
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
                'День  |  09:21',
                style: CustomTextStyles.basic.copyWith(color: CustomColors.purpleLight),
              ),
            ),
            Container(
              height: dp(41),
              child: Text(
                content['moodNames'][moodAssess.mood],
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
                        '${moodAssess.mood}',
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
                      content['getEventWord'](0),
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
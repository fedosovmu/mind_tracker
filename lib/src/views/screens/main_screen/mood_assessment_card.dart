import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/custom_text_styles.dart';
import '../../utils/metrics.dart';


class MoodAssessmentCard extends StatelessWidget with Content {
  int mood;
  int eventNumber;

  MoodAssessmentCard ({this.mood, this.eventNumber});

  @override
  Widget build(BuildContext context) {
    setWidgetName('moodAssessmentCard');
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
                content['moodNames'][mood],
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
                        '${eventNumber}',
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
                      content['getEventWord'](eventNumber),
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
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import '../../../../utils/metrics.dart';


class MoodAssessmentEmptyCard extends StatelessWidget {
  final PartOfDay missedPartOfDay;

  MoodAssessmentEmptyCard(this.missedPartOfDay);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(12)),
      width: double.infinity,
      height: dp(136),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
      child: Container(
        padding: EdgeInsets.only(left: dp(16), right: dp(32)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: dp(164),
              height: dp(46),
              child: FlatButton(
                onPressed: () { print('PRESS EMPTY CARD'); Navigator.pushNamed(context, '/moodAssessment'); },
                color: CustomColors.main,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(dp(12))
                ),
                child: Text(
                  Content.partOfDayNames[missedPartOfDay],
                  style: CustomTextStyles.buttonMedium,
                ),
              ),
            ),
            Container(
              width: dp(96),
              height: dp(96),
              decoration: BoxDecoration(
                color: CustomColors.purpleMegaDark,
                shape: BoxShape.circle
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class MoodAssessmentEmptyCard extends StatelessWidget {
  final DateTime missedDate;
  final PartOfDay missedPartOfDay;

  MoodAssessmentEmptyCard(this.missedDate, this.missedPartOfDay);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
      padding: EdgeInsets.only(left: dp(24.5), right: dp(32)),
      width: double.infinity,
      height: dp(136),
      decoration: ShapeDecoration(
          color: CustomColors.purpleSuperDark,
          shape: CustomBorderShape(
            dp(16),
            side: BorderSide(color: CustomColors.purpleMegaDark.withOpacity(0.32), width: dp(1))
          ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Оценить за ${Content.partOfDayNames[missedPartOfDay].toLowerCase()}',
            style: CustomTextStyles.buttonMedium,
          ),
          SizedBox(
            height: dp(95),
            width: dp(95),
            child: Container(
              child: DottedBorder(
                  borderType: BorderType.Circle,
                  strokeWidth: dp(1),
                  dashPattern: [8, 4],
                  padding: EdgeInsets.zero,
                  color: CustomColors.purpleLight.withOpacity(0.32),
                  child: Center(
                    child: Image.asset(
                      CustomIconPaths.largePlus,
                      color: CustomColors.purpleLight,
                      height: dp(32),
                      width: dp(32),
                    ),
                  )
              ),
              decoration: BoxDecoration(
                //color: Colors.red,
                color: CustomColors.purpleSuperDark.withOpacity(0.32),
                shape: BoxShape.circle
              ),
            ),
          )
        ],
      ),
    );
  }
}
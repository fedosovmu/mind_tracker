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
  final DateTime startDate;
  final DateTime endDate;
  final PartOfDay partOfDay;

  MoodFrequencyCard({@required this.startDate, @required this.endDate, this.partOfDay});

  @override
  Widget build(BuildContext context) {
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
                  'Нормальное',
                  style: CustomTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w500
                  ),
                ),
                Container(
                  height: dp(24),
                  width: dp(24),
                  decoration: BoxDecoration(
                    color: CustomColors.moods[4],
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
                      '9',
                      style: CustomTextStyles.caption,
                    ),
                    Text(
                      '/16',
                      style: CustomTextStyles.caption.copyWith(
                        color: CustomColors.purpleMedium
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
}
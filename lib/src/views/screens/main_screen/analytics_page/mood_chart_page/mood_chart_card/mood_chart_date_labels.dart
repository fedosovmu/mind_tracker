import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class MoodChartDateLabels extends StatelessWidget {
  static const weekDayNames = ['Пн', 'Вт', 'Ср' , 'Чт' ,'Пт' ,'Сб' ,'Вс'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dp(14)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) {
            final int day = index + DateTime.now().day - 6;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$day',
                  style: CustomTextStyles.basic.copyWith(
                      color: CustomColors.purpleLight
                  ),
                ),
                Text(
                  '${weekDayNames[(day - 1) % 7]}',
                  style: CustomTextStyles.basic.copyWith(
                      color: CustomColors.purpleTextSecondary
                  ),
                )
              ],
            );
          })
      ),
    );
  }
}
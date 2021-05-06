import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class MoodAssessmentEmptyCard extends StatefulWidget {
  final DateTime missedDate;
  final PartOfDay missedPartOfDay;

  MoodAssessmentEmptyCard(this.missedDate, this.missedPartOfDay);

  @override
  _MoodAssessmentEmptyCardState createState() => _MoodAssessmentEmptyCardState();
}

class _MoodAssessmentEmptyCardState extends State<MoodAssessmentEmptyCard> with SingleTickerProviderStateMixin {
  AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
    _animation.value = 0;
  }

  void _startAnimation() {
    _animation.forward(from: 0);
  }

  void _stopAnimation() {
    _animation.reverse(from: 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startAnimation(),
      onTapUp: (_) => _stopAnimation(),
      onTapCancel: () => _stopAnimation(),
      onTap: () {
        print('PRESS EMPTY CARD ${widget.missedDate.toStringDate()}, ${widget.missedPartOfDay.toShortString()}');
        Navigator.pushNamed(context, '/moodAssessment/partOfDay',
            arguments: {'date': widget.missedDate, 'partOfDay': widget.missedPartOfDay});
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, builder) {
          final animationValue = Curves.easeInOut.transform(_animation.value);
          return Transform.scale(
            scale: 1 - 0.03 * animationValue,
            child: Container(
              margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
              padding: EdgeInsets.only(left: dp(24.5), right: dp(32)),
              width: double.infinity,
              height: dp(136),
              decoration: BoxDecoration(
                  color: CustomColors.purpleSuperDark,
                  borderRadius: CustomBorderRadius(dp(16)),
                  border: Border.all(color: CustomColors.purpleMegaDark.withOpacity(0.32), width: dp(1))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Оценить за ${Content.partOfDayNames[widget.missedPartOfDay]}',
                    style: CustomTextStyles.buttonMedium,
                  ),
                  SizedBox(
                    height: dp(95),
                    width: dp(95),
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
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
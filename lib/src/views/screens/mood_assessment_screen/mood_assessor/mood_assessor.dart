import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment_screen/mood_assessor/mood_assessor_slider.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MoodAssessor extends StatelessWidget {
  static final _pathsToMoodSpheres = Map.fromIterable(
      List.generate(7, (i) => i + 1),
      key: (item) => item,
      value: (item) => 'assets/images/common/mood_spheres/$item.png'
  );

  final int currentMood;
  final Function onChanged;

  MoodAssessor({@required this.currentMood, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(314),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: dp(210),
            margin: EdgeInsets.symmetric(horizontal: dp(16)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(dp(16))),
              color: CustomColors.purpleSuperDark,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    Content.moodNames[currentMood],
                    style: CustomTextStyles.titleH1,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: dp(40),
                  padding: EdgeInsets.symmetric(horizontal: dp(29)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Настроение',
                        style: CustomTextStyles.basic.copyWith(color: CustomColors.purpleLight),
                      ),
                      Text(
                        'Потяни',
                        style: CustomTextStyles.basic.copyWith(color: CustomColors.purpleLight),
                      )
                    ],
                  ),
                ),
                MoodAssessorSlider(
                    currentMood: this.currentMood,
                    onChanged: this.onChanged
                )
              ],
            ),
          ),
          Positioned(
              top: 10,
              child: Image.asset(
                _pathsToMoodSpheres[currentMood],
                height: dp(214),
              )
          ),
        ],
      ),
    );
  }
}
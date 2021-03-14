import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class MoodAssessorSlider extends StatelessWidget {
  static const _pathToMoodSliderImage = 'assets/images/mood_assessment/mood_slider.png';
  double _currentSliderValue;
  final int currentMood;
  final Function onChanged;

  MoodAssessorSlider({@required this.currentMood, @required this.onChanged}) {
    _currentSliderValue = currentMood.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: dp(80),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: dp(26),
              child: Image.asset(
                _pathToMoodSliderImage,
                width: dp(270),
                color: CustomColors.moods[currentMood],
              ),
            ),
            Positioned(
                top: dp(21),
                left: dp(22) + (currentMood - 1) * dp(43),
                child: Container(
                  width: dp(24),
                  height: dp(24),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Container(
                    width: dp(13.33),
                    height: dp(13.33),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColors.moods[currentMood],
                    ),
                  ),
                )
            ),
            Positioned(
                bottom: dp(13),
                child: Container(
                    width: dp(258),
                    height: dp(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(7, (index) {
                        var color;
                        if (index + 1 == currentMood) {
                          color = CustomColors.moods[currentMood];
                        }
                        else {
                          color = CustomColors.purpleDark;
                        }
                        return Container(
                          color: color,
                          width: dp(2),
                          height: dp(16),
                        );
                      }),
                    )
                )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: dp(13)),
              child: SliderTheme(
                data: SliderThemeData(
                    thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 0,
                        disabledThumbRadius: 0,
                        pressedElevation: 0
                    ),
                    thumbColor: const Color(0x00),
                    overlayColor: const Color(0x00),
                    activeTrackColor: const Color(0x00),
                    inactiveTrackColor: const Color(0x00),
                    activeTickMarkColor: const Color(0x00),
                    inactiveTickMarkColor: const Color(0x00)
                ),
                child: Slider(
                  value: _currentSliderValue,
                  min: 1,
                  max: 7,
                  divisions: 6,
                  onChanged: this.onChanged,
                ),
              ),
            ),
          ],
        )
    );
  }
}
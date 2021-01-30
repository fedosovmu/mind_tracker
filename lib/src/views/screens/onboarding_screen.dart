import 'package:flutter/material.dart';
import '../utils/custom_text_styles.dart';
import '../utils/custom_colors.dart';
import '../utils/app_content.dart';
import '../utils/metrics.dart';
import 'mood_assessment_screen.dart';
import '../utils/widget_data.dart';


class OnboardingScreen extends StatelessWidget with WidgetData {
  var _screenNumber;
  OnboardingScreen ({int screenNumber = 1}) {
    this._screenNumber = screenNumber;
    setWidgetName('onboardingScreen');
  }

  void _goToNextScreen(BuildContext context) {
    var nextScreen;
    if (_screenNumber >= 4) {
      nextScreen = MoodAssessmentScreen(showSkipButton: true,);
    }
    else {
      nextScreen = OnboardingScreen(screenNumber: _screenNumber + 1);
    }
    Navigator.of(context).push(
        PageRouteBuilder(
            pageBuilder: (context, _, __) => nextScreen,
            transitionsBuilder: (___, animation, ____, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: dp(24),
                ),
                Image(
                  image: AssetImage(content['pathsToImages'][_screenNumber]),
                  height: dp(370),
                ),
                Container(
                  height: dp(55),
                  padding: EdgeInsets.only(bottom: dp(18)),
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: dp(54),
                    height: dp(9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                          var circle_color = CustomColors.purpleSuperDark;
                          if (index+1 == _screenNumber) {
                            circle_color = CustomColors.purpleLight;
                          }
                          return Container(
                            width: dp(9),
                            decoration: BoxDecoration(
                              color: circle_color,
                              shape: BoxShape.circle
                            ),
                          );
                        }
                      )
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: dp(16), right: dp(16)),
                  child:  Text(
                      content['screenTexts'][_screenNumber],
                      style: CustomTextStyles.basicH1Medium.copyWith(color: CustomColors.silverWhite),
                  ),
                ),
              ],
            ),
            Container(
                width: double.infinity,
                height: dp(68),
                padding: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
                child: FlatButton (
                    color: CustomColors.main,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(dp(16))),
                    ),
                    onPressed: () { _goToNextScreen(context); },
                    child: Text(
                      content['nextButtonText'],
                      style: CustomTextStyles.buttonMedium,
                    )
                )
            )
          ],
        )
    );
  }
}
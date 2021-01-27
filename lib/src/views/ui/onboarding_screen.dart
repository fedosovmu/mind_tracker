import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_content.dart';
import '../utils/app_text_styles.dart';
import '../utils/metrics.dart';
import 'mood_assessment_screen.dart';


class OnboardingScreen extends StatelessWidget {
  var _screenNumber;
  OnboardingScreen (int screen) {
    this._screenNumber = screen;
  }

  void goToNextScreen(BuildContext context) {
    var nextScreen;
    if (_screenNumber >= 4) {
      nextScreen = MoodAssessmentScreen(showSkipButton: true,);
    }
    else {
      nextScreen = OnboardingScreen(_screenNumber + 1);
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
                  image: AssetImage(AppContent.onboardingScreen['pathsToImages'][_screenNumber]),
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
                          var circle_color = AppColors.onboardingScreen['circleColor'];
                          if (index+1 == _screenNumber) {
                            circle_color = AppColors.onboardingScreen['activeCircleColor'];
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
                      AppContent.onboardingScreen['screenTexts'][_screenNumber],
                      style: AppTextStyles.onboardingScreen['secondaryTextStyle'],
                  ),
                ),
              ],
            ),
            Container(
                width: double.infinity,
                height: dp(68),
                padding: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
                child: RaisedButton (
                    color: AppColors.onboardingScreen['nextButtonColor'],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(dp(16))),
                    ),
                    onPressed: () { goToNextScreen(context); },
                    child: Text(
                      AppContent.onboardingScreen['nextButtonText'],
                      style: AppTextStyles.onboardingScreen['nextButtonTextStyle'],
                    )
                )
            )
          ],
        )
    );
  }
}
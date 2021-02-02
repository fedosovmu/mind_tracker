import 'package:flutter/material.dart';
import '../utils/custom_text_styles.dart';
import '../utils/custom_colors.dart';
import '../utils/content.dart';
import '../utils/metrics.dart';
import 'mood_assessment_screen.dart';


class OnboardingScreen extends StatelessWidget with Content {
  var _pageNumber;
  OnboardingScreen ({int pageNumber = 1}) {
    this._pageNumber = pageNumber;
    loadContent('onboardingScreen');
  }

  void _goToNextScreen(BuildContext context) {
    var nextScreenPath;
    if (_pageNumber >= 4) {
      nextScreenPath = '/moodAssessment/first';
    }
    else {
      nextScreenPath = '/onboarding/${_pageNumber+1}';
    }
    Navigator.pushNamed(context, nextScreenPath);
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
                  image: AssetImage(content['pathsToImages'][_pageNumber]),
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
                          if (index+1 == _pageNumber) {
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
                      content['screenTexts'][_pageNumber],
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
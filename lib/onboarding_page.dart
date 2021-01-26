import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_content.dart';
import 'metrics.dart';
import 'mood_assessment_page.dart';


class OnboardingPage extends StatelessWidget {
  var _pageNumber;
  OnboardingPage (int page) {
    this._pageNumber = page;
  }

  void goToNextPage(BuildContext context) {
    var nextPage;
    if (_pageNumber >= 4) {
      nextPage = MoodAssessmentPage();
    }
    else {
      nextPage = OnboardingPage(_pageNumber + 1);
    }
    Navigator.of(context).push(
        PageRouteBuilder(
            pageBuilder: (context, _, __) => nextPage,
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
        //backgroundColor: const Color(0xFF322A42),
      backgroundColor: AppColors.onboardingPage['backgroundColor'],
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
                  image: AssetImage(AppContent.onboardingPage['pathsToImages'][_pageNumber]),
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
                          var circle_color = AppColors.onboardingPage['circleColor'];
                          if (index+1 == _pageNumber) {
                            circle_color = AppColors.onboardingPage['activeCircleColor'];
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
                      AppContent.onboardingPage['pageTexts'][_pageNumber],
                      style: TextStyle(
                          fontSize: dp(16),
                          color: AppColors.onboardingPage['secondaryTextColor'],
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                      )
                  ),
                ),
              ],
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
                child: FlatButton (
                    color: AppColors.onboardingPage['nextButtonColor'],
                    height: dp(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(dp(16))),
                    ),
                    onPressed: () { goToNextPage(context); },
                    child: Text(
                      AppContent.onboardingPage['nextButtonText'],
                      style: TextStyle(
                        fontSize: dp(18),
                        color: AppColors.onboardingPage['nextButtonTextColor'],
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                )
            )
          ],
        )
    );
  }
}
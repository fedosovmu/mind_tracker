import 'package:flutter/material.dart';
import '../utils/theme/custom_text_styles.dart';
import '../utils/theme/custom_colors.dart';
import '../utils/metrics.dart';


class OnboardingScreen extends StatelessWidget {
  static const Map<int, String> _screenTexts = {
    1: "Следите за своим ментальным состоянием оценивая его по шкале с семью градациями.",
    2: "Важно делать отметки несколько раз в день, устанавливайте напоминания в удобное время.",
    3: "Отмечайте, что произошло за день. Приложение поможет вам проанализировать, как привычки "
      "влияют на ваш внутренний баланс.",
    4: "Чем дольше вы ведёте записи, тем более ценные данные получите. "
      "Вы убедитесь в очевидных связях между событиями и эмоциями и обнаружите неочевидные."
  };
  static const Map<int, String> _pathsToImages = {
    1: "assets/images/onboarding/lamp.png",
    2: "assets/images/onboarding/fishes.png",
    3: "assets/images/onboarding/butterfly.png",
    4: "assets/images/onboarding/monkey.png"
  };
  static const String _nextButtonNextText = 'Далее';
  static const String _nextButtonStartText = 'Начать';

  final int pageNumber;
  static const int _pageCount = 4;
  OnboardingScreen ({this.pageNumber = 1});

  bool _isThisLastPage() {
    return pageNumber == _pageCount;
  }

  void _goToNextScreen(BuildContext context) {
    var nextScreenPath;
    if (pageNumber >= _pageCount) {
      Navigator.pushNamed(context, '/moodAssessment/firstStart');
    }
    else {
      Navigator.of(context).push(
          PageRouteBuilder(
              pageBuilder: (context, _, __) => OnboardingScreen(pageNumber: pageNumber+1),
              transitionsBuilder: (___, animation, ____, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          minimum: EdgeInsets.only(bottom: dp(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: dp(24),
                  ),
                  Image(
                    image: AssetImage(_pathsToImages[pageNumber]),
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
                            if (index+1 == pageNumber) {
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
                        _screenTexts[pageNumber],
                        style: CustomTextStyles.basicH1Medium.copyWith(color: CustomColors.purpleSilverWhite),
                    ),
                  ),
                ],
              ),
              Container(
                  width: double.infinity,
                  height: dp(60),
                  padding: EdgeInsets.only(left: dp(16), right: dp(16)),
                  child: FlatButton (
                      color: CustomColors.main,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
                      ),
                      onPressed: () { _goToNextScreen(context); },
                      child: Text(
                        _isThisLastPage() ? _nextButtonStartText : _nextButtonNextText,
                        style: CustomTextStyles.buttonMedium,
                      )
                  )
              )
            ],
          ),
        )
    );
  }
}
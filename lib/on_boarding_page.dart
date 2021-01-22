import 'dart:ffi';
import 'package:flutter/material.dart';


class OnBoardingPage extends StatelessWidget {
  var _pageNumber;
  OnBoardingPage (int page) {
    this._pageNumber = page;
  }

  //final pageNumber = 1;
  static const _pageTexts = {
    1: "Следите за своим ментальным состоянием оценивая его по шкале с семью градациями.",
    2: "Важно делать отметки несколько раз в день, устанавливаете напоминания в удобное время.",
    3: "Отмечайте, что произошло за день. Приложение поможет вам проанализировать, как привычки  влияют на ваш внутренний баланс.",
    4: "Чем дольше вы ведёте записи, тем более ценные данные получите. Вы убедитесь в очевидных связях между  событиями и эмоциями  и обнаружите неочевидные."
  };
  static const _pathsToImages = {
    1: "assets/images/onboarding/lamp.png",
    2: "assets/images/onboarding/fishes.png",
    3: "assets/images/onboarding/butterfly.png",
    4: "assets/images/onboarding/monkey.png"
  };

  void goToNextPage(BuildContext context) {
    if (_pageNumber >= 4) {
      print('This is END page');
      return;
    }
    var nextPage = _pageNumber + 1;
    //Navigator.of(context).pushNamed('on_boarding_page/$nextPage');
    //Navigator.of(context).push(
    //  MaterialPageRoute(builder: (context) => OnBoardingPage(nextPage))
    //);
    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, _, __) => OnBoardingPage(nextPage),
          transitionsBuilder: (___, animation, ____, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          }
      )
    );
  }

  var _dpScale;
  void setDpScale(context) {
    final deviceScreenWidth = MediaQuery.of(context).size.width;
    const designScreenWidth = 360;
    _dpScale = deviceScreenWidth / designScreenWidth;
  }

  double dp(pixels) {
    return (pixels * _dpScale);
  }

  @override
  Widget build(BuildContext context) {
    setDpScale(context);

    return Scaffold(
        backgroundColor: const Color(0xFF322A42),
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
                  image: AssetImage(_pathsToImages[_pageNumber]),
                  height: dp(370),
                ),
                SizedBox(
                  height: dp(55),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: dp(16), right: dp(16)),
                  child:  Text(
                      _pageTexts[_pageNumber],
                      style: TextStyle(
                          fontSize: dp(16),
                          color: Color(0xFFF9EFF6),
                          fontFamily: "Roboto",
                      )
                  ),
                ),
              ],
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
                child: FlatButton (
                    color: const Color(0xFF674A7A),
                    height: dp(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    onPressed: () { goToNextPage(context); },
                    child: Text(
                      "Далее",
                      style: TextStyle(fontSize: dp(18), color: Colors.white),
                    )
                )
            )
          ],
        )
    );
  }
}
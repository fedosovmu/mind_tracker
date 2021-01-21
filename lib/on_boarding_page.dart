import 'dart:ffi';
import 'package:flutter/material.dart';


class OnBoardingPage extends StatelessWidget {
  final pageNumber = 1;
  static const pageTexts = {
    1: "Следите за своим ментальным состоянием оценивая его по шкале с семью градациями.",
    2: "Важно делать отметки несколько раз в день, устанавливаете напоминания в удобное время.",
    3: "Отмечайте, что произошло за день. Приложение поможет вам проанализировать, как привычки  влияют на ваш внутренний баланс.",
    4: "Чем дольше вы ведёте записи, тем более ценные данные получите. Вы убедитесь в очевидных связях между  событиями и эмоциями  и обнаружите неочевидные."
  };

  var dp_scale = null;
  void set_dp_scale(context) {
    final device_screen_width = MediaQuery.of(context).size.width;
    const design_screen_width = 360;
    dp_scale = device_screen_width / design_screen_width;
  }

  double dp(pixels) {
    return (pixels * dp_scale);
  }

  @override
  Widget build(BuildContext context) {
    set_dp_scale(context);

    return Scaffold(
        backgroundColor: const Color(0xFF322A42),
        appBar: null,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  color: const Color(0xFF261E35),
                  width: double.infinity,
                  height: dp(370),
                ),
                SizedBox(
                  height: dp(55),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: dp(16), right: dp(16)),
                  child:  Text(
                      pageTexts[pageNumber],
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
                    onPressed: () { print("Next button pressed"); },
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
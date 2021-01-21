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

  @override
  Widget build(BuildContext context) {
    final device_screen_width = MediaQuery.of(context).size.width;
    const design_screen_width = 360;
    final scale = device_screen_width / design_screen_width;

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
                  height: 400,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 18, left: 16, right: 16),
                  child:  Text(
                      pageTexts[pageNumber],
                      textScaleFactor: scale,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFF9EFF6),
                          fontFamily: "Roboto",
                      )
                  ),
                ),
              ],
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: FlatButton (
                    color: const Color(0xFF674A7A),
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    onPressed: () { print("Next button pressed"); },
                    child: Text(
                      "Далее",
                      textScaleFactor: scale,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                )
            )
          ],
        )
    );
  }
}
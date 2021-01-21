import 'dart:ffi';
import 'package:flutter/material.dart';


class OnBoardingPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
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
                Container(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                  child:  Text(
                      "Следите за своим ментальным состоянием оценивая его по шкале с семью градациями",
                      style: TextStyle(fontSize: 16, color: Color(0xFFF9EFF6))
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
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                )
            )
          ],
        )
    );
  }
}
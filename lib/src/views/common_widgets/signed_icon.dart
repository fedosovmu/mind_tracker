import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import '../utils/metrics.dart';


class SignedIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: IconButton(
        padding: EdgeInsets.zero,
        splashRadius: dp(44),
        iconSize: dp(56),
        icon: Container(
            //width: dp(57),
            //height: dp(44),
            color: Colors.red
        ),
        onPressed: () { print('Bottom menu pressed'); },
      ),
    );
  }
}
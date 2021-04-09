import 'package:flutter/material.dart';


class GlowDisabler extends StatelessWidget {
  final Widget child;

  GlowDisabler({@required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
          return true;
        },
      child: child
    );
  }
}
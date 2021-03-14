import 'package:flutter/material.dart';


class SingleChildScrollViewWithoutSplash extends StatelessWidget {
  final Widget child;

  SingleChildScrollViewWithoutSplash({@required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
      },
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: this.child
      ),
    );
  }
}


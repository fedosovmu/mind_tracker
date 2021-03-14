import 'package:flutter/material.dart';


class CustomSingleChildScrollView extends StatelessWidget {
  final Widget child;

  CustomSingleChildScrollView({@required this.child});

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


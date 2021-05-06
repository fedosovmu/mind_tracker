import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class MoodSphere extends StatelessWidget {
  final int cardIndex;
  final int mood;

  MoodSphere({@required this.cardIndex, @required this.mood});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: dp(-5) + cardIndex * dp(136+8),
        right: dp(-20),
        child: IgnorePointer(
          child: Image.asset(
            'assets/images/common/mood_spheres/$mood.png',
            width: dp(220),
          ),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_image_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class MoodSphere extends StatefulWidget {
  final int cardIndex;
  final int mood;
  final AnimationController animationController;

  MoodSphere({@required this.cardIndex, @required this.mood, this.animationController});

  @override
  _MoodSphereState createState() => _MoodSphereState();
}

class _MoodSphereState extends State<MoodSphere> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.animationController, 
        builder: (_, __) {
          final animationValue = Curves.easeInOut.transform(widget.animationController.value);
          final scale = 1 - 0.03 * animationValue;
          const cardHeightInDp = 136+8;
          return Positioned(
              top: dp(-5) + widget.cardIndex * dp(cardHeightInDp),
              right: dp(-20) + dp(3 * animationValue),
              child: IgnorePointer(
                child: Transform.scale(
                  scale: scale,
                  child: Image.asset(
                    CustomImagePaths.pathsToMoodSphereImages[widget.mood],
                    width: dp(220),
                  ),
                ),
              )
          );
        }
    );
  }
}
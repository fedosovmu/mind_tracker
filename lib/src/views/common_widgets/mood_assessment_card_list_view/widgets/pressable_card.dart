import 'package:flutter/material.dart';


class PressableCard extends StatefulWidget {
  final Function onPressed;
  final Widget child;
  final AnimationController animationController;

  PressableCard({this.onPressed, this.child, this.animationController});

  @override
  _PressableCardState createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {

  void _startAnimation() {
    widget.animationController.forward();
  }

  void _stopAnimation() {
    widget.animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startAnimation(),
      onTapUp: (_) => _stopAnimation(),
      onTapCancel: () => _stopAnimation(),
      onTap: widget.onPressed,
      child: AnimatedBuilder(
          animation: widget.animationController,
          builder: (context, builder) {
            final animationValue = Curves.easeInOut.transform(widget.animationController.value);
            final scale = 1 - 0.03 * animationValue;
            return Transform.scale(
              scale: scale,
              child: widget.child
            );
          }
      ),
    );
  }
}
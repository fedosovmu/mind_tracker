import 'package:flutter/material.dart';


class PressableCard extends StatefulWidget {
  final Function onPressed;
  final Widget child;

  PressableCard({this.onPressed, this.child});

  @override
  _PressableCardState createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> with SingleTickerProviderStateMixin {
  AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
    _animation.value = 0;
  }

  void _startAnimation() {
    _animation.forward(from: 0);
  }

  void _stopAnimation() {
    _animation.reverse(from: 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startAnimation(),
      onTapUp: (_) => _stopAnimation(),
      onTapCancel: () => _stopAnimation(),
      onTap: widget.onPressed,
      child: AnimatedBuilder(
          animation: _animation,
          builder: (context, builder) {
            final animationValue = Curves.easeInOut.transform(_animation.value);
            return Transform.scale(
              scale: 1 - 0.03 * animationValue,
              child: widget.child
            );
          }
      ),
    );
  }
}
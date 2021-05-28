import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class AddNotificationButton extends StatefulWidget {
  final Function onPressed;

  AddNotificationButton({@required this.onPressed});

  @override
  _AddNotificationButtonState createState() => _AddNotificationButtonState();
}

class _AddNotificationButtonState extends State<AddNotificationButton> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 100)
    );
    _animationController.value = 0;
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _animationController.forward();
  }

  void _stopAnimation() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startAnimation(),
      onTapUp: (_) => _stopAnimation(),
      onTapCancel: () => _stopAnimation(),
      onTap: widget.onPressed,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final animationValue = Curves.easeInOut.transform(_animationController.value);
          final scale = 1 - 0.1 * animationValue;
          return Transform.scale(
            scale: scale,
            child: child
          );
        },
        child: Container(
          height: dp(48),
          width: dp(48),
          decoration: BoxDecoration( //TODO: edit box shape
              color: CustomColors.purpleSuperDark,
              borderRadius: BorderRadius.all(Radius.circular(dp(16))),
              border: Border.all(width: dp(1), color: CustomColors.purpleMegaDark)
          ),
          child: Center(
            child: Image.asset(
              CustomIconPaths.plusInCircle,
              height: dp(24),
              width: dp(24),
            ),
          ),
        ),
      ),
    );
  }
}
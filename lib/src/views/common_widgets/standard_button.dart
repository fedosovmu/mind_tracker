import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class StandardButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  final bool enabled;
  final Color backgroundColor;

  StandardButton({@required this.title, @required this.onPressed, this.enabled = true, this.backgroundColor = CustomColors.main});

  @override
  _StandardButtonState createState() => _StandardButtonState();
}

class _StandardButtonState extends State<StandardButton> {
  bool _isPressed = false;

  void _setIsPressed (bool value) {
    setState(() {
      _isPressed = value;
    });
  }

  Color _getBackgroundColor() {
    if (!widget.enabled) {
      return Color(0xFF504761);
    }
    if (_isPressed) {
      return Color.lerp(widget.backgroundColor, CustomColors.white, 0.3);
    }
    return widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled ? widget.onPressed : null,
      onTapDown: (_) => _setIsPressed(true),
      onTapCancel: () => _setIsPressed(false),
      onTapUp: (_) => _setIsPressed(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: dp(56),
        width: double.infinity,
        decoration: ShapeDecoration(
          color: _getBackgroundColor(),
          shape: CustomBorderShape(dp(16)),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: CustomTextStyles.buttonMedium.copyWith(
              color: widget.enabled ? CustomColors.white : CustomColors.purpleDark
            ),
          ),
        ),
      ),
    );
  }
}
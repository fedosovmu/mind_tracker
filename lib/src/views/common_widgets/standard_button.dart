import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class StandardButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  final bool enabled;

  StandardButton({@required this.title, @required this.onPressed, this.enabled = true});

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
      return Color.lerp(CustomColors.main, CustomColors.white, 0.3);
    }
    return CustomColors.main;
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
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: CustomBorderRadius(dp(16))
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


class _StandardButtonStyle extends ButtonStyle{
  _StandardButtonStyle () : super(
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    minimumSize: MaterialStateProperty.resolveWith((states) => Size(double.infinity, dp(56))),
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Color(0xFF504761);
      }
      if (states.contains(MaterialState.pressed)) {
        return Color.lerp(CustomColors.main, CustomColors.white, 0.3);
      }
      return CustomColors.main;
    }),
    foregroundColor: MaterialStateProperty.all(Colors.red),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: CustomBorderRadius(dp(16)))
    )
  );
}
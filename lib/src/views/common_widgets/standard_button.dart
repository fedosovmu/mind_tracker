import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class StandardButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  StandardButton({@required this.title, @required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: CustomTextStyles.buttonMedium,
        ),
        style: _StandardButtonStyle()
    );
  }
}


class _StandardButtonStyle extends ButtonStyle{
  _StandardButtonStyle () : super(
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    minimumSize: MaterialStateProperty.resolveWith((states) => Size(double.infinity, dp(56))),
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        final pressedButtonColor = Color.lerp(CustomColors.main, CustomColors.white, 0.3);
        return pressedButtonColor;
      }
      return CustomColors.main;
    }),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: CustomBorderRadius(dp(16)))
    )
  );
}
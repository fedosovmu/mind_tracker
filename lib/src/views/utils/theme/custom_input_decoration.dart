import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CustomInputDecoration extends InputDecoration {
  CustomInputDecoration ({@required String hintText}) :
        super(
          hintText: hintText,
          filled: true,
          fillColor: CustomColors.purpleSuperDark.withOpacity(0.32),
          hintStyle: CustomTextStyles.basicH1Regular.copyWith(
              color: CustomColors.purpleLight.withOpacity(0.64)
          ),
          enabledBorder: _CustomInputBorder(CustomColors.purpleMegaDark.withOpacity(0.4)),
          focusedBorder: _CustomInputBorder(CustomColors.main),
          errorBorder: _CustomInputBorder(CustomColors.moods[3]),
          focusedErrorBorder: _CustomInputBorder(CustomColors.moods[3]),
          errorStyle: CustomTextStyles.caption.copyWith(
              color: CustomColors.moods[3]
          ),
      );
}

class _CustomInputBorder extends OutlineInputBorder {
  _CustomInputBorder (Color borderColor) : super(
      borderRadius: BorderRadius.all(Radius.circular(dp(16))), //TODO: edit this radius
      borderSide: BorderSide(
          width: dp(1),
          color: borderColor
      )
  );
}
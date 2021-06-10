import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_colors.dart';


final appTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: CustomColors.purpleDark,
  accentColor: CustomColors.main,
  splashColor: CustomColors.purpleDark,
);

const appSystemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: CustomColors.purpleDark,
  systemNavigationBarColor: CustomColors.purpleDark
);

final appSystemUiOverlayStyleDark = appSystemUiOverlayStyle.copyWith(
  systemNavigationBarColor: CustomColors.purpleSuperDark
);


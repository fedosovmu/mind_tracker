import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_colors.dart';
import 'metrics.dart';


final colors = CustomColors;

final appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: CustomColors.purpleDark,
    elevation: 0,
  ),
  accentColor: CustomColors.main,
  brightness: Brightness.dark,
  primaryColor: CustomColors.purpleDark,
  scaffoldBackgroundColor: CustomColors.purpleDark,
);

final appSystemUiOverlayStyle = SystemUiOverlayStyle(
  systemNavigationBarColor: CustomColors.purpleDark
);
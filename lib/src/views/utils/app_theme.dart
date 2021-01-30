import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_colors.dart';
import 'custom_text_styles.dart';
import 'metrics.dart';


final appTheme = ThemeData(
  accentColor: CustomColors.main,
  brightness: Brightness.dark,
  primaryColor: CustomColors.purpleDark,
  scaffoldBackgroundColor: CustomColors.purpleDark,
);

const appSystemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: CustomColors.purpleDark,
  systemNavigationBarColor: CustomColors.purpleDark
);
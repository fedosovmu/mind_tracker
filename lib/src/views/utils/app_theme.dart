import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_colors.dart';


final appTheme = ThemeData(
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: CustomColors.purpleDark,
  accentColor: CustomColors.main,
);

const appSystemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: CustomColors.purpleDark,
  systemNavigationBarColor: CustomColors.purpleDark
);
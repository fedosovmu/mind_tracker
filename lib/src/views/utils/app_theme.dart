import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'metrics.dart';


final colors = AppColors.widgetsData['appTheme'];

final appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: colors['background'],
    elevation: 0,
  ),
  accentColor: colors['accent'],
  brightness: Brightness.dark,
  primaryColor: colors['background'],
  scaffoldBackgroundColor: colors['background'],
);

final appSystemUiOverlayStyle = SystemUiOverlayStyle(
  systemNavigationBarColor: colors['background']
);
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'metrics.dart';


final colors = AppColors.widgetsData['appTheme'];
final AppTheme  = ThemeData(
  appBarTheme: AppBarTheme(
    color: colors['background'],
    elevation: 0,
  ),
  accentColor: colors['accent'],
  brightness: Brightness.dark,
  primaryColor: colors['background'],
  scaffoldBackgroundColor: colors['background'],
);

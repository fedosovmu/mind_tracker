import 'package:flutter/material.dart';
import 'metrics.dart';
import 'app_colors.dart';


class AppTextStyles {
  static const _textColor = Colors.white;
  static const _fontFamily = 'Roboto';
  
  static final _designTextStyles = {
    'Basic H6': TextStyle(
        color: _textColor,
        fontSize: dp(20),
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700
    ),
    'Basic H1': TextStyle(
      color: _textColor,
      fontSize: dp(16),
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500
    ),
    'Basic': TextStyle(
        color: _textColor,
        fontSize: dp(14),
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400
    ),
    'Caption': TextStyle(
      color: _textColor,
      fontSize: dp(12),
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400
    ),
    'Button/Basic': TextStyle(
      color: _textColor,
      fontSize: dp(18),
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400
    ),
    'Button/Medium': TextStyle(
      color: _textColor,
      fontSize: dp(18),
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500
    ),
  };

  static final android = {

  };
}
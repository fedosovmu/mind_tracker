import 'package:flutter/material.dart';
import 'metrics.dart';
import 'app_colors.dart';


class AppTextStyles {
  static final _textColors = AppColors.textColors;
  static final _defaultTextColor = _textColors['white'];
  static const _fontFamily = 'Roboto';

  static final _designStyles = {
    'Title H1': TextStyle(
        color: _defaultTextColor,
        fontSize: dp(20),
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700
    ),
    'Basic H1': TextStyle(
      color: _defaultTextColor,
      fontSize: dp(16),
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500
    ),
    'Basic': TextStyle(
        color: _defaultTextColor,
        fontSize: dp(14),
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400
    ),
    'Caption': TextStyle(
      color: _defaultTextColor,
      fontSize: dp(12),
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400
    ),
    'Button/Basic': TextStyle(
      color: _defaultTextColor,
      fontSize: dp(18),
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400
    ),
    'Button/Medium': TextStyle(
      color: _defaultTextColor,
      fontSize: dp(18),
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500
    ),
  };

  static final onboardingScreen = {
    'secondaryTextStyle': _designStyles['Basic H1'].copyWith(
        color: _textColors['silverWhite']),
    'nextButtonTextStyle': _designStyles['Button/Medium']
  };

  static final moodAssessmentScreen = {
    'titleTextStyle': _designStyles['Title H1'],
    'assessMoodButtonTextStyle': _designStyles['Button/Medium'],
    'skipButtonTextStyle': _designStyles['Button/Basic'].copyWith(
        color: Color(0xFFACA5BA)),
    'moodAssessorMoodTextStyle': _designStyles['Title H1'].copyWith(
        fontWeight: FontWeight.w500),
    'moodAssessorSecondaryTextStyle': _designStyles['Basic'].copyWith(
        color: _textColors['purpleLight']),
  };
}
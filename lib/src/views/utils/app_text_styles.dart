import 'package:flutter/material.dart';
import 'metrics.dart';
import 'custom_colors.dart';


class AppTextStyles {
  static final _defaultTextColor = CustomColors.white;
  static const _fontFamily = 'Roboto';

  static final _basicTextStyle = TextStyle(
      color: CustomColors.white,
      fontFamily: 'Roboto'
  );

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

  static final widgetsData = {
    'onboardingScreen': {
      'secondary': _designStyles['Basic H1'].copyWith(
          color: CustomColors.silverWhite),
      'nextButton': _designStyles['Button/Medium']
    },

    'moodAssessmentScreen': {
      'title': _designStyles['Title H1'],
      'assessMoodButton': _designStyles['Button/Medium'],
      'skipButton': _designStyles['Button/Basic'].copyWith(
          color: Color(0xFFACA5BA)),
      'moodAssessorMood': _designStyles['Title H1'].copyWith(
          fontWeight: FontWeight.w500),
      'moodAssessorSecondary': _designStyles['Basic'].copyWith(
          color: CustomColors.purpleLight),
    },

    'mainScreen': {
      'title': _designStyles['Title H1'],
    },

    'moodAssessmentCard': {
      'dayTime': _designStyles['Basic'].copyWith(
          color: CustomColors.purpleLight),
      'mood': _designStyles['Title H1'],
      'events': _designStyles['Basic'].copyWith(
          color: CustomColors.purpleLight),
    },

    'emptyMoodAssessmentCard': {
      'button': _designStyles['Button/Medium'],
    },
  };
}
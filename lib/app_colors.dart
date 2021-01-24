import 'package:flutter/material.dart';


class AppColors {
  static const _designColors = {
    'Black': Color(0xFF000000),
    'Dark': Color(0xFF1A1C20),
    'MiniDark': Color(0xFF2C2C31),
    'SilverWhite': Color(0xFFF9EFF6),
    'White': Color(0xFFFFFFFF),
    'MainColors': {
      'Basic': Color(0xFFFFFFFF),
      'CTA': Color(0xFF674A7A),
    } as dynamic,
    'MoodColors': {
      '1': Color(0xFF674A7A),
      '2': Color(0xFFA43485),
      '3': Color(0xFFEC4B68),
      '4': Color(0xFFFF709B),
      '5': Color(0xFF6C8AF3),
      '6': Color(0xFF02C1B6),
      '7': Color(0xFF30BA00),
    } as dynamic,
    'Purple': {
      'MegaDark': Color(0xFF191327),
      'SuperDark': Color(0xFF261E35),
      'Dark': Color(0xFF322A42),
      'TextSecondary': Color(0xFF876D8F),
      'Light': Color(0xFFD3B2CA),
    } as dynamic,
  };

  static final onboardingPage = {
    'backgroundColor': _designColors['Purple']['Dark'],
    'circleColor': _designColors['Purple']['SuperDark'],
    'activeCircleColor': _designColors['Purple']['Light'],
    'secondaryTextColor': _designColors['SilverWhite'],
    'nextButtonColor': _designColors['MainColors']['CTA'],
    'nextButtonTextColor': _designColors['White'],
  };
}

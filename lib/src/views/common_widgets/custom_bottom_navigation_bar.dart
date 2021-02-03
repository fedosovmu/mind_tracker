import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/metrics.dart';
import '../utils/theme/custom_text_styles.dart';
import '../utils/theme/custom_colors.dart';
import 'signed_icon.dart';


class CustomBottomNavigationBar extends CupertinoTabBar {
  static const _pathsToIcons = [
    'assets/icons/home.png',
    'assets/icons/analytics.png',
    'assets/icons/settings.png'
  ];
  static const _texts = ['Главный', 'Аналитика', 'Календарь'];
  static final _textStyle = CustomTextStyles.basic.copyWith(fontSize: 14);
  static const _activeColor = CustomColors.silverWhite;
  static const _inactiveColor = CustomColors.purpleTextSecondary;

  CustomBottomNavigationBar () : super(
    border: Border(top: BorderSide(color: Color(0xFF766379))),
    backgroundColor: CustomColors.purpleSuperDark,
    activeColor: CustomColors.silverWhite,
    inactiveColor: CustomColors.silverWhite,
    iconSize: 32,
    items: List.generate(3, (index) => BottomNavigationBarItem(
        activeIcon: Image.asset(_pathsToIcons[index], height: 32),
        icon: Image.asset(_pathsToIcons[index], height: 32, color: _inactiveColor),
      label: _texts[index]
    ))
  );
}
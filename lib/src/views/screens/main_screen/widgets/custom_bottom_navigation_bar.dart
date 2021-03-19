import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../utils/metrics.dart';
import '../../../utils/theme/custom_text_styles.dart';
import '../../../utils/theme/custom_colors.dart';


class CustomBottomNavigationBar extends CupertinoTabBar {
  static const _pathsToIcons = [
    'assets/icons/home.png',
    'assets/icons/chart.png',
    'assets/icons/chart.png',
    'assets/icons/calendar.png'
  ];
  static const _texts = ['Главный', 'График', 'События', 'Календарь'];

  CustomBottomNavigationBar () : super(
    currentIndex: 0, //TODO delete this line in prodaction
    border: Border(top: BorderSide(color: Color(0xFF766379))),
    backgroundColor: CustomColors.purpleSuperDark,
    activeColor: CustomColors.silverWhite,
    inactiveColor: CustomColors.silverWhite,
    iconSize: 32,
    items: List.generate(_texts.length, (index) => BottomNavigationBarItem(
        activeIcon: Image.asset(_pathsToIcons[index], height: 32),
        icon: Image.asset(_pathsToIcons[index], height: 32, color: CustomColors.purpleTextSecondary),
      label: _texts[index]
    ))
  );
}
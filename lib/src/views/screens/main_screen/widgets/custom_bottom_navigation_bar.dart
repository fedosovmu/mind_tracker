import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import '../../../utils/theme/custom_colors.dart';


class CustomBottomNavigationBar extends CupertinoTabBar {
  static const _pathsToIcons = [
    CustomIconPaths.home,
    CustomIconPaths.chart,
    CustomIconPaths.events,
    CustomIconPaths.calendar
  ];
  static const _texts = ['Главный', 'График', 'События', 'Календарь'];

  CustomBottomNavigationBar () : super(
    currentIndex: 0, //TODO delete this line in prodaction
    border: Border(top: BorderSide(color: Color(0xFF766379))),
    backgroundColor: CustomColors.purpleSuperDark,
    activeColor: CustomColors.purpleWhite,
    inactiveColor: CustomColors.purpleLight,
    iconSize: 32,
    items: List.generate(_texts.length, (index) => BottomNavigationBarItem(
        activeIcon: Image.asset(_pathsToIcons[index], height: 24),
        icon: Image.asset(_pathsToIcons[index], height: 24, color: CustomColors.purpleMedium),
      label: _texts[index]
    ))
  );
}
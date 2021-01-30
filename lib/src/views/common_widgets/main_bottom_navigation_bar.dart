import 'package:flutter/material.dart';
import '../utils/custom_text_styles.dart';
import '../utils/custom_colors.dart';


class MainBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      backgroundColor: CustomColors.purpleSuperDark,
      selectedIconTheme: IconThemeData(
          color: CustomColors.silverWhite
      ),
      unselectedIconTheme: IconThemeData(
          color: CustomColors.main
      ),
      selectedLabelStyle: CustomTextStyles.basic.copyWith(
          color: CustomColors.purpleLight
      ),
      unselectedLabelStyle: CustomTextStyles.basic.copyWith(
          color: CustomColors.purpleLight
      ),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главный'),
        BottomNavigationBarItem(icon: Icon(Icons.timeline), label: 'Аналитика'),
        //BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Календарь'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Настройки'),
      ],
    );
  }

}


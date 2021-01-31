import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/metrics.dart';
import '../utils/custom_text_styles.dart';
import '../utils/custom_colors.dart';
import 'signed_icon.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  static const _pathsToIcons = [
    'assets/icons/home.png',
    'assets/icons/analytics.png',
    'assets/icons/settings.png'
  ];
  static const _texts = ['Главный', 'Аналитика', 'Настройки'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dp(56),
      child: Column(
        children: [
          Container(
            color: Color(0xFF766379),
            height: dp(1),
          ),
          Expanded(
            child: Material(
              color: CustomColors.purpleSuperDark,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: dp(30)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) {
                    return SignedIcon(
                      icon: Image.asset(
                        _pathsToIcons[index],
                        color: index == 0 ? CustomColors.silverWhite : CustomColors.purpleTextSecondary,
                        width: dp(24),
                        height: dp(24),
                      ),
                      text: _texts[index]
                    );
                  })
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class SelectEventsScreen extends StatelessWidget {
  static const _pathToBackIcon = 'assets/icons/ui/back.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Выбор собятия',
        leading: IconButton(
          iconSize: dp(32),
          icon: Image.asset(_pathToBackIcon),
          onPressed: () {
            print('Back button pressed');
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(8)),
        child: GridView.count(
          mainAxisSpacing: dp(16),
          crossAxisSpacing: dp(24),
          crossAxisCount: 4,
          childAspectRatio: EventIcon.aspectRatio,
          children: List.generate(7, (index) {
            return EventIcon();
          }),
        ),
      ),
    );
  }
}


class EventIcon extends StatelessWidget {
  static const _pathToFoodIcon = 'assets/icons/events/food.png';
  static const _widthInDp = 64;
  static const _heightInDp = 115;
  static const aspectRatio = _widthInDp / _heightInDp;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              width: dp(64),
              height: dp(64),
              decoration: BoxDecoration(
                  color: CustomColors.purpleSuperDark,
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Image.asset(
                  _pathToFoodIcon,
                  width: dp(40),
                  height: dp(40),
                ),
              )
          ),
          SizedBox(height: dp(8),),
          Text(
            'Текст в три строчки',
            style: CustomTextStyles.caption.copyWith(
                color: CustomColors.purpleLight
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
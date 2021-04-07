import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class SelectEventsScreen extends StatelessWidget {
  static const _pathToBackIcon = 'assets/icons/ui/close.png';
  static const _pathToFoodIcon = 'assets/icons/events/food.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Выбор собятия',
        leading: IconButton(
          icon: Image.asset(_pathToBackIcon),
          onPressed: () { print('Back button pressed'); },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(8)),
        child: GridView.count(
          mainAxisSpacing: dp(16),
          crossAxisSpacing: dp(24),
          crossAxisCount: 4,
          childAspectRatio: 64 / 115,
          children: List.generate(7, (index) {
            return _buildEventIcon();
          }),
        ),
      ),
    );
  }

  Widget _buildEventIcon() {
    return Container(
      width: dp(64),
      height: dp(115),
      //color: Colors.red,
      child: Column(
        children: [
          Container(
            width: dp(64),
            height: dp(64),
            decoration: BoxDecoration(
              color: CustomColors.purpleSuperDark,
              shape: BoxShape.circle
            ),
            child: Image(
              image: AssetImage(_pathToFoodIcon),
              height: 24,
              width: 24,
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
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CreateUserEventSelectIconScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Добавление своего события',
        leading: CustomLeading(
          pathToIcon: CustomIconPaths.back,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Выберите подходящую иконку',
                  style: CustomTextStyles.basicH1Medium.copyWith(
                    color: CustomColors.purpleWhite
                  )
                ),
                SizedBox(height: dp(24)),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: dp(16),
                    crossAxisSpacing: dp(24),
                    childAspectRatio: 1,
                    children: List.generate(CustomIconPaths.eventIcons.length, (i) {
                      final iconName = CustomIconPaths.eventIcons.keys.toList()[i];
                      return EventIconWithoutText(iconName);
                    }),
                  )
                ),
              ],
            ),
          ),
          Positioned(
            left: dp(16),
            right: dp(16),
            bottom: dp(16),
            child: StandardButton(
              title: 'Создать',
              onPressed: () {
                var count = 0;
                Navigator.popUntil(context, (route) {
                  return count++ == 2;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class EventIconWithoutText extends StatelessWidget {
  final String iconName;

  EventIconWithoutText(this.iconName);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        shape: BoxShape.circle
      ),
      child: Center(
        child: Image.asset(
          CustomIconPaths.eventIcons[iconName],
          width: dp(24),
          height: dp(24),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/glow_disabler.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/create_user_event/widgets/event_icon_without_text.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CreateUserEventSelectIconScreen extends StatefulWidget {
  @override
  _CreateUserEventSelectIconScreenState createState() => _CreateUserEventSelectIconScreenState();
}

class _CreateUserEventSelectIconScreenState extends State<CreateUserEventSelectIconScreen> {
  String _selectedIcon;

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
                  child: GlowDisabler(
                    child: CustomScrollView(
                      physics: ClampingScrollPhysics(),
                      slivers: [
                        SliverGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: dp(16),
                          crossAxisSpacing: dp(24),
                          childAspectRatio: 1,
                          children: List.generate(CustomIconPaths.eventIcons.length, (i) {
                            final iconName = CustomIconPaths.eventIcons.keys.toList()[i];
                            return EventIconWithoutText(
                              iconName: iconName,
                              isSelected: _selectedIcon == iconName,
                              onPressed: () {
                                print('select icon');
                                setState(() {
                                  _selectedIcon = iconName;
                                });
                              },
                            );
                          }),
                        ),
                        SliverPadding(padding: EdgeInsets.only(bottom: dp(56+16)))
                      ],
                    ),
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
              enabled: _selectedIcon != null,
              onPressed: () {
                Navigator.of(context).pop(_selectedIcon);
              },
            ),
          )
        ],
      ),
    );
  }
}
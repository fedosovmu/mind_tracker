import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_input_decoration.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CreateUserEventTitleScreen extends StatelessWidget {
  final TextEditingController _userEventTitleTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Добавление своего события',
        leading: CustomLeading(
          pathToIcon: CustomIconPaths.back,
          onPressed: () {
            print('Back icon pressed');
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(dp(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _userEventTitleTextEditingController,
                  decoration: CustomInputDecoration(
                    hintText: 'Введите текст события'
                  ),
                ),
                SizedBox(height: dp(8)),
                Padding(
                  padding: EdgeInsets.only(left: dp(16)),
                  child: Text(
                    'Текст не должен привышать 27 символов',
                    style: CustomTextStyles.caption.copyWith(
                      color: CustomColors.purpleMedium
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: dp(16),
            right: dp(16),
            bottom: dp(16),
            child: StandardButton(
              title: 'Далее',
              onPressed: () async {
                final icon = await Navigator.of(context).pushNamed('/createUserEventSelectIcon');
                if (icon != null) {
                  final userEventTitle = _userEventTitleTextEditingController.text;
                  final newUserEvent = Event(icon: icon, title: userEventTitle);
                  Navigator.of(context).pop(newUserEvent);
                }
              },
            )
          )
        ],
      )
    );
  }
}
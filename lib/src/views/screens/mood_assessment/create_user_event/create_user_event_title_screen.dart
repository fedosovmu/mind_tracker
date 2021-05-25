import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/views/common_widgets/app_bar/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/app_bar/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/other/standard_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/create_user_event/widgets/event_title_input.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CreateUserEventTitleScreen extends StatefulWidget {
  @override
  _CreateUserEventTitleScreenState createState() => _CreateUserEventTitleScreenState();
}

class _CreateUserEventTitleScreenState extends State<CreateUserEventTitleScreen> {
  final TextEditingController _userEventTitleTextEditingController = TextEditingController();
  bool isInputDataCorrect = false;

  @override
  void initState() {
    super.initState();

    _userEventTitleTextEditingController.addListener(() {
      setState(() {
        final text = _userEventTitleTextEditingController.text;
        isInputDataCorrect = text.length >= 1 && text.length <= 27;
      });
    });
  }

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
                EventTitleInput(controller: _userEventTitleTextEditingController),
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
              enabled: isInputDataCorrect,
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
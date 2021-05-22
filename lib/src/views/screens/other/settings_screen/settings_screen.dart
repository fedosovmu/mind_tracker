import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/screens/other/settings_screen/widgets/login_out_panel.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Настройки',
        leading: CustomLeading(
          pathToIcon: CustomIconPaths.back,
          onPressed: () {
            print('Press back button');
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: dp(16)),
        child: Column(
          children: [
            SizedBox(height: dp(16)),
            LoginOutPanel(),
            //SizedBox(height: dp(16)),
            NotificationPanel()
          ],
        ),
      ),
    );
  }
}


class NotificationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Уведомления',
              style: CustomTextStyles.titleH1.copyWith(
                color: CustomColors.purpleMedium
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Нет уведомлений',
                  style: CustomTextStyles.basic.copyWith(
                    color: CustomColors.purpleLight
                  ),
                ),
                TextButton(
                    child: Text(
                      'Настроить',
                      style: CustomTextStyles.basic.copyWith(
                          color: Colors.blue
                      ),
                    ),
                    onPressed: () {
                      print('Set notification button pressed');
                      Navigator.of(context).pushNamed('/notification');
                    }
                )
              ],
            )
          ],
        )
    );
  }
}
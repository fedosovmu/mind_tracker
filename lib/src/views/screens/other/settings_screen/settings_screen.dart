import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/app_bar/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/app_bar/custom_leading.dart';
import 'package:mind_tracker/src/views/screens/other/settings_screen/widgets/login_out_panel.dart';
import 'package:mind_tracker/src/views/screens/other/settings_screen/widgets/notification_panel.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


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
            SizedBox(height: dp(16)),
            NotificationPanel(),
          ],
        ),
      ),
    );
  }
}
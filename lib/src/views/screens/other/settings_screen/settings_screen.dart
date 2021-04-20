import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/auth_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:provider/provider.dart';


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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: dp(16)),
        child: LoginOutPanel(),
      ),
    );
  }
}


class LoginOutPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Тестовая информация',
                  style: CustomTextStyles.titleH1.copyWith(
                      color: CustomColors.purpleMedium
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'User id: ${authProvider.uid}',
                        style: CustomTextStyles.caption.copyWith(
                            color: CustomColors.purpleLight
                        )
                    ),
                    TextButton(
                        child: Text('Выйти'),
                        onPressed: () {
                          print('Exit button pressed');
                          if (authProvider.isAuthorized) {
                            authProvider.signOut();
                            Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                          }
                        }
                    )
                  ],
                ),
                SizedBox(height: dp(32))
              ],
            ),
          );
        }
    );
  }

}
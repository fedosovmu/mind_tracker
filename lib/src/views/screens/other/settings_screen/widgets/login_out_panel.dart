import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/auth_provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:provider/provider.dart';


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
                  'Аккаунт',
                  style: CustomTextStyles.titleH1.copyWith(
                      color: CustomColors.purpleMedium
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${authProvider.email}',
                        style: CustomTextStyles.basic.copyWith(
                            color: CustomColors.purpleLight
                        )
                    ),
                    TextButton(
                        child: Text(
                          'Выйти',
                          style: CustomTextStyles.basic.copyWith(
                              color: Colors.blue
                          ),
                        ),
                        onPressed: () {
                          print('Exit button pressed');
                          if (authProvider.isAuthorized) {
                            authProvider.signOut();
                          }
                          Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
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
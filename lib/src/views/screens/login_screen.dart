import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Авторизация через почту',
        leading: CustomLeading(
          pathToIcon: CustomIconPaths.back,
          onPressed: () {
            print('Back button pressed');
          },
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(bottom: dp(16)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: dp(16)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: dp(32)),
                color: Colors.green,
                width: double.infinity,
                height: dp(56),
              ),
              Container(
                margin: EdgeInsets.only(top: dp(16)),
                color: Colors.red,
                width: double.infinity,
                height: dp(56),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: dp(32)),
                child: StandardButton(
                    title: 'Войти',
                    onPressed: () { print('Log in'); }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
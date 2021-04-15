import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/screens/onboarding/login_screen/widgets/login_input.dart';
import 'package:mind_tracker/src/views/screens/onboarding/login_screen/widgets/password_input.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Авторизация через почту',
        leading: CustomLeading(
          pathToIcon: CustomIconPaths.back,
          onPressed: () {
            print('Back button pressed');
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: dp(16)),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              LoginInput(),
              SizedBox(height: dp(16)),
              PasswordInput(),
              SizedBox(height: dp(32),),
              StandardButton(
                  title: 'Войти',
                  onPressed: () {
                    print('Log in button pressed');
                    final isValid = _formKey.currentState.validate();
                    print('Validation $isValid');
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
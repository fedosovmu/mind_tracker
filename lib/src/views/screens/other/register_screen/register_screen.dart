import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/auth_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/email_input.dart';
import 'package:mind_tracker/src/views/common_widgets/password_input.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Регистрация',
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: dp(32)),
              EmailInput(_emailTextEditingController),
              SizedBox(height: dp(16)),
              PasswordInput(_passwordTextEditingController),
              SizedBox(height: dp(32)),
              StandardButton(
                  title: 'Зарегистрироваться',
                  onPressed: () async {
                    print('Register button pressed');
                    bool isValid = _formKey.currentState.validate();
                    if (isValid) {
                      final errorCode = await Provider.of<AuthProvider>(context, listen: false).createUserWithEmailAndPassword(
                          email: _emailTextEditingController.text,
                          password: _passwordTextEditingController.text,
                      );
                      if (errorCode != null) {
                        print('Error $errorCode');
                      }
                    }
                  }
              )
            ],
          ),
        )
      ),
    );
  }
}
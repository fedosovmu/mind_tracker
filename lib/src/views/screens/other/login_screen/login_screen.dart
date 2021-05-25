import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/auth_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/app_bar/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/other/standard_button.dart';
import 'package:mind_tracker/src/views/screens/other/login_screen/widgets/custom_text_button.dart';
import 'package:mind_tracker/src/views/common_widgets/inputs/email_input.dart';
import 'package:mind_tracker/src/views/common_widgets/inputs/password_input.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Авторизация через почту',
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
                  title: 'Войти',
                  onPressed: () async {
                    print('Log in button pressed');
                    final isValid = _formKey.currentState.validate();
                    if (isValid) {
                      final errorCode = await Provider.of<AuthProvider>(context, listen: false).signInWithEmailAndPassword(
                          email: _emailTextEditingController.text,
                          password: _passwordTextEditingController.text
                      );
                      if (errorCode != null) {
                        print('Error $errorCode');
                      }
                    }
                  }
              ),
              SizedBox(height: dp(16)),
              CustomTextButton(
                  title: 'Зарегистрироваться',
                  onPressed: () {
                    print('Register button pressed');
                    Navigator.of(context).pushNamed('/register');
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
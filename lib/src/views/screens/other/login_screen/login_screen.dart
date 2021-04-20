import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/auth_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/screens/other/login_screen/widgets/login_input.dart';
import 'package:mind_tracker/src/views/screens/other/login_screen/widgets/password_input.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final loginTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return Scaffold(
        appBar: CustomAppBar(
          title: 'Авторизация через почту',
          leading: authProvider.isAuthorized ? CustomLeading(
            pathToIcon: CustomIconPaths.back,
            onPressed: () {
              print('Back button pressed');
              Navigator.pop(context);
            },
          ) : null,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: dp(16)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: dp(32)),
                LoginInput(loginTextEditingController),
                SizedBox(height: dp(16)),
                PasswordInput(passwordTextEditingController),
                SizedBox(height: dp(32)),
                StandardButton(
                    title: 'Войти',
                    onPressed: () async {
                      print('Log in button pressed');
                      final isValid = _formKey.currentState.validate();
                      print('Validation $isValid');
                      if (!authProvider.isAuthorized) {
                        var authErrorCode = await Provider.of<AuthProvider>(context, listen: false).signInWithEmailAndPassword(
                            email: loginTextEditingController.text,
                            password: passwordTextEditingController.text
                        );
                        if (authErrorCode == null) {
                          Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
                        }
                      }
                    }
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
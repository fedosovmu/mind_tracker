import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


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
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: dp(16)),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildLoginInput(),
              SizedBox(height: dp(16)),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Пароль',
                  filled: true,
                  fillColor: CustomColors.purpleSuperDark.withOpacity(0.32),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: dp(32)), //TODO: Заменить на SizedBox
                child: StandardButton(
                    title: 'Войти',
                    onPressed: () {
                      print('Log in button pressed');
                      final isValid = _formKey.currentState.validate();
                      print('Validation $isValid');
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginInput() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Почта',
        filled: true,
        fillColor: CustomColors.purpleSuperDark.withOpacity(0.32),
        hintStyle: CustomTextStyles.basicH1Regular.copyWith(
            color: CustomColors.purpleLight.withOpacity(0.64)
        ),
        enabledBorder: CustomInputBorder(CustomColors.purpleLight.withOpacity(0.4)),
        focusedBorder: CustomInputBorder(CustomColors.main),
        errorBorder: CustomInputBorder(CustomColors.moods[3]),
        focusedErrorBorder: CustomInputBorder(CustomColors.moods[3]),
        errorStyle: CustomTextStyles.caption.copyWith(
          color: CustomColors.moods[3]
        ),
        focusColor: Colors.green,
        hoverColor: Colors.yellow
      ),
      validator: (String input) {
        if (input.isEmpty) {
          return 'Введите текст';
        } else {
          return null;
        }
      },
    );
  }
}

class CustomInputBorder extends OutlineInputBorder {
  CustomInputBorder (Color borderColor) : super(
    borderRadius: CustomBorderRadius(dp(12)),
    borderSide: BorderSide(
      width: dp(1),
      color: borderColor
    )
  );
}
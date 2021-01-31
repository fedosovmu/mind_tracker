import 'package:flutter/material.dart';
import '../utils/custom_text_styles.dart';
import '../utils/custom_colors.dart';
import '../utils/metrics.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final leading;
  static final _toolbarHeight = dp(56);
  
  CustomAppBar ({this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.purpleDark,
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: dp(56),
      title: Text(
        title,
        style: CustomTextStyles.titleH1,
      ),
      leading: leading,
      toolbarHeight: _toolbarHeight,
      titleSpacing: leading == null ? dp(16) : 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_toolbarHeight);

}
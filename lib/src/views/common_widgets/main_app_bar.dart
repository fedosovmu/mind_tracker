import 'package:flutter/material.dart';
import '../utils/custom_text_styles.dart';
import '../utils/custom_colors.dart';
import '../utils/metrics.dart';


class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final leading;
  static final toolbarHeight = dp(56);


  MainAppBar ({this.title, this.leading});

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
      toolbarHeight: toolbarHeight,
      titleSpacing: leading == null ? dp(16) : 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

}
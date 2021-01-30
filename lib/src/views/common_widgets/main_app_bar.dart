import 'package:flutter/material.dart';
import '../utils/custom_text_styles.dart';
import '../utils/metrics.dart';


class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final leading;
  static final toolbarHeight = dp(56);


  MainAppBar ({this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: CustomTextStyles.titleH1,
      ),
      leading: this.leading,
      toolbarHeight: toolbarHeight,
      titleSpacing: (){
        if (this.leading == null)
          return dp(16);
        else
          return 0.0;
      }(),
      leadingWidth: dp(56)
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

}
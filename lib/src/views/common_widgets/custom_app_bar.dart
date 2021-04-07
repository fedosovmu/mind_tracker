import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/theme/custom_text_styles.dart';
import '../utils/theme/custom_colors.dart';
import '../utils/metrics.dart';


class CustomAppBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final String title;
  final Widget leading;
  static final _appBarHeight = dp(56);
  static const _appBarBackgroundColor = CustomColors.purpleDark;
  
  CustomAppBar ({this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: _appBarBackgroundColor,
        height: _appBarHeight,
        width: double.infinity,
        child: Row(
          children: [
            _buildLeading(),
            Container(
              alignment: Alignment.centerLeft,
              color: _appBarBackgroundColor,
              child: Text(
                title,
                style: CustomTextStyles.titleH1,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLeading() {
    if (leading != null) {
      return Material(
        color: _appBarBackgroundColor,
        child: Container(
          width: dp(_appBarHeight),
          height: dp(_appBarHeight),
          alignment: Alignment.center,
          child: leading,
        ),
      );
    } else {
      return SizedBox(width: dp(16));
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(_appBarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
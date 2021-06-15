import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/theme/custom_text_styles.dart';
import '../../utils/theme/custom_colors.dart';
import '../../utils/metrics.dart';


class CustomAppBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final String title;
  final Widget leading;
  final Widget rightLeading;
  static final _appBarHeight = dp(56);
  static const _appBarBackgroundColor = CustomColors.purpleDark;
  
  CustomAppBar ({this.title, this.leading, this.rightLeading});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Material(
        color: _appBarBackgroundColor,
        child: Container(
          height: _appBarHeight,
          width: double.infinity,
          child: Stack(
            children: [
              Center(
                child: Text(
                  title,
                  style: CustomTextStyles.titleH1.copyWith(
                    color: CustomColors.purpleWhite
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildLeading(),
                  _buildRightLeading()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeading() {
    if (leading != null) {
      return Container(
        width: _appBarHeight,
        height: _appBarHeight,
        alignment: Alignment.center,
        child: leading,
      );
    } else {
      return SizedBox(width: dp(32));
    }
  }

  Widget _buildRightLeading() {
    if (rightLeading != null) {
      return Container(
        width: _appBarHeight,
        height: _appBarHeight,
        alignment: Alignment.center,
        child: rightLeading,
        margin: EdgeInsets.only(right: dp(8)),
      );
    } else {
      return SizedBox(width: dp(32));
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(_appBarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
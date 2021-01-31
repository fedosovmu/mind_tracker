import 'package:flutter/widgets.dart';
import '../utils/metrics.dart';
import '../utils/custom_text_styles.dart';
import '../utils/custom_colors.dart';
import 'signed_icon.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dp(56),
      child: Column(
        children: [
          Container(
            color: Color(0xFF766379),
            height: dp(1),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: dp(46)),
              color: CustomColors.purpleSuperDark,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      3, (index) => SignedIcon())
              ),
            ),
          ),
        ],
      ),
    );
  }
}
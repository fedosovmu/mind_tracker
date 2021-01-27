import 'package:flutter/cupertino.dart';

import 'app_text_styles.dart';
import 'app_colors.dart';
import 'app_content.dart';


mixin ScreenData {
  var content;
  var colors;
  var textStyles;

  void setScreenData(String screenName) {
    content = AppContent.screensData[screenName];
    colors = AppColors.screensData[screenName];
    textStyles = AppTextStyles.screensData[screenName];
  }
}
import 'package:flutter/cupertino.dart';

import 'app_text_styles.dart';
import 'app_colors.dart';
import 'app_content.dart';


mixin WidgetData {
  var content;
  var colors;
  var textStyles;

  void setWidgetName(String widgetName) {
    content = AppContent.widgetsData[widgetName];
    colors = AppColors.widgetsData[widgetName];
    textStyles = AppTextStyles.widgetsData[widgetName];
  }
}
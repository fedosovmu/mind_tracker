import 'custom_text_styles.dart';
import 'custom_colors.dart';
import 'app_content.dart';


mixin WidgetData {
  var content;
  var colors;
  var textStyles;

  void setWidgetName(String widgetName) {
    content = AppContent.widgetsData[widgetName];
  }
}
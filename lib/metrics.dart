import 'package:flutter/material.dart';


class Metrics {
  static var _dpScale;

  static void setDpScale() {
    final pixelRatio = WidgetsBinding.instance.window.devicePixelRatio;
    final screenWidth = WidgetsBinding.instance.window.physicalSize.width;
    final deviceScreenWidth = screenWidth / pixelRatio;
    const designScreenWidth = 360;
    _dpScale = deviceScreenWidth / designScreenWidth;
  }
}

double dp(pixels) {
  return (pixels * Metrics._dpScale);
}
import 'package:flutter/material.dart';


class _Metrics {
  static final dpScale = _setDpScale();

  static double _setDpScale() {
    final pixelRatio = WidgetsBinding.instance.window.devicePixelRatio;
    final screenWidth = WidgetsBinding.instance.window.physicalSize.width;
    final deviceScreenWidth = screenWidth / pixelRatio;
    const designScreenWidth = 360;
    return deviceScreenWidth / designScreenWidth;
  }
}

double dp(pixels) {
  return (pixels * _Metrics.dpScale);
}
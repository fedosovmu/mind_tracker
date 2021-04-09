import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class CustomLeading extends StatelessWidget {
  static const _pathToCloseIcon = 'assets/icons/ui/close.png';
  static const _pathToBackIcon = 'assets/icons/ui/back.png';
  String _pathToIcon;
  final Function onPressed;
  
  CustomLeading.withCloseIcon({@required this.onPressed}) {
    _pathToIcon = _pathToCloseIcon;
  }
  
  CustomLeading.withBackIcon({@required this.onPressed}) {
    _pathToIcon = _pathToBackIcon;
  }
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: dp(32),
      icon: Image.asset(_pathToIcon),
      onPressed: onPressed,
    );
  }
}
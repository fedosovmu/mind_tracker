import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';


class CustomLeading extends StatelessWidget {
  final String pathToIcon;
  final Function onPressed;
  
  CustomLeading({@required this.pathToIcon, @required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: dp(32),
      icon: Image.asset(pathToIcon),
      onPressed: onPressed,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';


class CustomLeading extends StatelessWidget {
  final String pathToIcon;
  final Function onPressed;
  final iconSize;
  
  CustomLeading({@required this.pathToIcon, @required this.onPressed, this.iconSize});
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(pathToIcon, height: iconSize ?? dp(32)),
      onPressed: onPressed,
    );
  }
}
import 'package:flutter/material.dart';

class CustomBorderShape extends ContinuousRectangleBorder {
  static const _correctionConstant = 2.4; // Умножение на даннную константу придает углу нужную форму

  CustomBorderShape (double radius, {BorderSide side = BorderSide.none}) : super (
    side: side,
    borderRadius: BorderRadius.all(Radius.circular(radius * _correctionConstant))
  );
}
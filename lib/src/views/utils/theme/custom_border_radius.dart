import 'package:flutter/material.dart';


class CustomBorderRadius extends BorderRadius {
  CustomBorderRadius(double radius) : super.all(Radius.elliptical(radius, radius));
}
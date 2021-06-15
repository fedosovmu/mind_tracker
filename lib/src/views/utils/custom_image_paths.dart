import 'package:flutter/material.dart';


class CustomImagePaths {
  CustomImagePaths._();

  static final Map<int, String> pathsToMoodSphereImages = Map.fromIterable(
    List.generate(7, (index) => index),
    key: (index) => index + 1,
    value: (index) => 'assets/images/common/mood_spheres/${index+1}.png'
  );

  static Future<void> loadImages(BuildContext context) async {
    for (var mood = 1; mood <= 7; mood++) {
      final image = AssetImage(pathsToMoodSphereImages[mood]);
      await precacheImage(image, context);
    }
  }

  static final Map<int, String> pathsToMoodSphereMiniImages = Map.fromIterable(
    List.generate(7, (index) => index),
    key: (index) => index + 1,
    value: (index) => 'assets/images/common/mood_spheres_mini/${index+1}.png'
  );
}
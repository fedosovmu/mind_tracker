import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/widget_data.dart';
import '../utils/metrics.dart';
import 'widgets/mood_assessment_card.dart';

import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:async';
import 'dart:io';


class MainScreen extends StatefulWidget with WidgetData {
  var _moodAssess;

  MainScreen({int moodAssess = null}) {
      _moodAssess = moodAssess;
  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetData {
  ui.Image _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  _loadImage () async {
    ByteData bd = await rootBundle.load('assets/images/common/mood_spheres/5.png');
    final Uint8List bytes = Uint8List.view(bd.buffer);
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.Image image = (await codec.getNextFrame()).image;
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    setWidgetName('mainScreen');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          content['title'],
          style: textStyles['title'],
        ),
        toolbarHeight: dp(56),
        titleSpacing: dp(16),
      ),
      body: Container(
        color: Colors.yellow,
        child: CustomPaint(
          foregroundPainter: _SpherePainter(_image),
          child: Container(
            color: Colors.blue
          ),
        )
      )
    );
  }
}

class _SpherePainter extends CustomPainter {
  ui.Image _image;

  _SpherePainter (image) : super () {
    _image = image;
  }

  @override
  Future paint(Canvas canvas, Size size) async {
    if (_image != null) {
      canvas.drawImage(_image, Offset.zero, Paint());
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
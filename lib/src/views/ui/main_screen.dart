import 'package:flutter/material.dart';
import '../utils/widget_data.dart';
import '../utils/metrics.dart';
import 'widgets/mood_assessment_card.dart';


class MainScreen extends StatefulWidget with WidgetData {
  var _moodAssess;

  MainScreen({int moodAssess = null}) {
      _moodAssess = moodAssess;
  }

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State with WidgetData {
  var _futureString;
  var _futureImage;

  @override
  void initState() {
    super.initState();
    _futureString = _getFutureString();
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
        child: FutureBuilder<String>(
          future: _futureString,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(color: Colors.green);
            } else {
              return Container(color: Colors.red);
            }
          },

        ),
      )
    );
  }

  Future<String> _getFutureString() async {
    await Future.delayed(Duration(seconds: 3));
    return Future.value('This in future');
  }

  Future<Image> _loadImage() async {
    _futureImage = await Image.asset('assets/images/common/mood_spheres/5.png');
    return _futureImage;
  }
}

class _SpherePainter extends CustomPainter {
  var _image;

  _SpherePainter () {
    var image = Image.asset('assets/images/common/mood_spheres/5.png');
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
        ..color = Color(0x5000FF00);

    const sphereImageAspectRatio = 257 / 214;
    const sphereImageWidth = 200;
    const sphereImageHeigth = sphereImageWidth / sphereImageAspectRatio;
    final rect = Rect.fromLTWH(dp(360 - sphereImageWidth-16), dp(0), dp(sphereImageWidth), dp(sphereImageHeigth));
    Offset imagePos = Offset(dp(100), dp(100));

    canvas.drawRect(rect, paint);
    //canvas.drawImage(_image, imagePos, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
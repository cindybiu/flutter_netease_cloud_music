import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = !true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'netease_cloud_music',
      theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black)),
      home: Home(),
    );
  }
}


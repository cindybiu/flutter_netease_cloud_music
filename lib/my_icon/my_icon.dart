library font_social_flutter;
    
import 'package:flutter/widgets.dart';

class MyIcon {
  static const IconData music = const _MyIconData(0xe629);
  static const IconData playlist = const _MyIconData(0xe627);
  static const IconData download = const _MyIconData(0xe622);
  static const IconData radio = const _MyIconData(0xe624);
  static const IconData shoucang = const _MyIconData(0xe623);
  static const IconData qq = const _MyIconData(0xe6ac);
}

class _MyIconData extends IconData {
  const _MyIconData(int codePoint)
      : super(
    codePoint,
    fontFamily: 'MyIcon',
    fontPackage: 'my_icon',
  );
}
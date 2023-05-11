import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();  

  static TextStyle h1([double? fontSize]) => TextStyle(fontFamily: 'Gotham-Black', fontSize: fontSize ?? 50);
  static TextStyle h2([double? fontSize]) => TextStyle(fontFamily: 'Gotham-Bold', fontSize: fontSize ?? 24);
  static TextStyle normal([double? fontSize]) => TextStyle(fontFamily: 'GothamMedium', fontSize: fontSize ?? 16);
  static TextStyle light([double? fontSize]) => TextStyle(fontFamily: 'Gotham-Light', fontSize: fontSize ?? 14);
  static TextStyle normalItalic([double? fontSize]) => TextStyle(fontFamily: 'GothamMedium', fontSize: fontSize ?? 16, fontStyle: FontStyle.italic);
  static TextStyle lightItalic([double? fontSize]) => TextStyle(fontFamily: 'Gotham-Light', fontSize: fontSize ?? 14, fontStyle: FontStyle.italic);
}

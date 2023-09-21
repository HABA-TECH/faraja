import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  static TextStyle h1([double? fontSize, Color? colors]) => TextStyle(
      fontFamily: 'Gotham-Black',
      fontSize: fontSize ?? 50,
      color: colors ?? Colors.black);
  static TextStyle h2([double? fontSize]) => TextStyle(
      fontFamily: 'Gotham-Bold', fontSize: fontSize ?? 24, color: Colors.black);
  static TextStyle normal([double? fontSize, Color? colors]) => TextStyle(
      fontFamily: 'GothamMedium',
      fontSize: fontSize ?? 16,
      color: colors ?? Colors.black);
  static TextStyle title([double? fontSize, Color? colors]) => TextStyle(
      fontFamily: 'GothamMedium',
      fontSize: fontSize ?? 22,
      color: colors ?? Colors.black);
  static TextStyle light([double? fontSize, Color? colors]) => TextStyle(
      fontFamily: 'Gotham-Light',
      fontSize: fontSize ?? 14,
      color: colors ?? Colors.black);
  static TextStyle normalItalic([double? fontSize, Color? colors]) => TextStyle(
      fontFamily: 'GothamMedium',
      fontSize: fontSize ?? 16,
      fontStyle: FontStyle.italic,
      color: Colors.black);
  static TextStyle lightItalic([double? fontSize, Color? colors]) => TextStyle(
      fontFamily: 'Gotham-Light',
      fontSize: fontSize ?? 14,
      fontStyle: FontStyle.italic,
      color: Colors.black);
}

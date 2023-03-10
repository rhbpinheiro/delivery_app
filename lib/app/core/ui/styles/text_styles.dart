import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => "mplus1";

  TextStyle get textLight =>
      TextStyle(fontWeight: FontWeight.w300, fontFamily: font);
  TextStyle get textRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: font);
  TextStyle get textMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: font);
  TextStyle get textSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: font);
  TextStyle get textBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: font);
  TextStyle get texExtratBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: font);
  TextStyle get textTitle => texExtratBold.copyWith(fontSize: 28);
  TextStyle get textButtontLabel => textBold.copyWith(fontSize: 14);
}

extension TextStylesExtensiond on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}

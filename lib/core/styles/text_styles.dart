import 'package:flutter/material.dart';

import 'app_font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
  String fontFamily,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

// light

TextStyle getLightStyle({
  required double fontSize,
  required Color color,
  String fontFamily = FontConstants.caroFamily,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
    fontFamily,
  );
}

// regular style

TextStyle getRegularStyle({
  required double fontSize,
  required Color color,
  String fontFamily = FontConstants.caroFamily,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
    fontFamily,
  );
}

// medium style

TextStyle getMediumStyle(
    {required double fontSize,
    required Color color,
    String fontFamily = FontConstants.caroFamily,
    bool isItalic = false}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
    fontFamily,
  );
}

// bold style

TextStyle getSemiBoldStyle(
    {required double fontSize,
    required Color color,
    String fontFamily = FontConstants.caroFamily,
    bool isItalic = false}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
    fontFamily,
  );
}

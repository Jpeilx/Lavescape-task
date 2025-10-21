import 'package:flutter/material.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, String fontFamily,
    {bool textLinethrough = false, bool isItalic = false}) {
  return TextStyle(
      decoration:
          textLinethrough ? TextDecoration.lineThrough : TextDecoration.none,
      decorationColor: AppColors.klightGreyColor,
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {required double fontSize,
    required Color color,
    required String fontFamily,
    bool textLinethrough = false,
    bool isItalic = false}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, fontFamily,
      textLinethrough: textLinethrough, isItalic: isItalic);
}

// medium style

TextStyle getMediumStyle(
    {required double fontSize,
    required Color color,
    required String fontFamily,
    bool isItalic = false}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, fontFamily,
      isItalic: isItalic);
}

// medium style

TextStyle getLightStyle(
    {required double fontSize,
    required Color color,
    required String fontFamily,
    bool isItalic = false}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color, fontFamily,
      isItalic: isItalic);
}

// bold style

TextStyle getBoldStyle(
    {required double fontSize,
    required Color color,
    required String fontFamily,
    bool isItalic = false}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, fontFamily,
      isItalic: isItalic);
}

// semibold style

TextStyle getSemiBoldStyle(
    {required double fontSize,
    required Color color,
    required String fontFamily,
    bool isItalic = false}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, fontFamily,
      isItalic: isItalic);
}

TextStyle getHighStyle(
    {required double fontSize,
    required Color color,
    required String fontFamily,
    bool isItalic = false}) {
  return _getTextStyle(fontSize, FontWeightManager.extraBold, color, fontFamily,
      isItalic: isItalic);
}

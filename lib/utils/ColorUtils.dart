import 'package:flutter/material.dart';

class ColorUtils {
  static String primaryColor = '#0F437B';

  static Color colorConvert(String color) {
    color = color.replaceAll('#', '');

    if (color.length == 6) {
      return Color(int.parse("0xFF" + color));
    } else if (color.length == 8) {
      return Color(int.parse("0x" + color));
    }
  }
}

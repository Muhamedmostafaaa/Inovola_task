import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fonts_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.getFont(FontConstants.fontFamily,
      textStyle:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color));
}

// bold style
TextStyle getBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style
TextStyle getSemiBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
  );
}

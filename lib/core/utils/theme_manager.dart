import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovola_task/core/utils/colors_manager.dart';
import 'package:inovola_task/core/utils/fonts_manager.dart';
import 'package:inovola_task/core/utils/styles_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(

    /// Scaffold
    scaffoldBackgroundColor: ColorManager.backGroundColor,

    ///TEXT THEME
    textTheme: TextTheme(
        displayLarge: getBoldStyle(
          fontSize: 42.sp,
          color: ColorManager.boldTextColor,
        ),
        displayMedium: getBoldStyle(
            color: ColorManager.regularTextColor, fontSize: FontSize.s35),
        displaySmall: getSemiBoldStyle(
            fontSize: 35.sp, color: ColorManager.regularTextColor),
      labelLarge: getBoldStyle(
        fontSize: FontSize.s40,
        color: ColorManager.backGroundColor,
      ),),
  );
}

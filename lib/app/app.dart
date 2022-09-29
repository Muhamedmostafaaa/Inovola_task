import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovola_task/core/utils/theme_manager.dart';
import 'package:inovola_task/features/details/presentation/screens/details_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );
    return
      ScreenUtilInit(
        designSize: const Size(1080, 2277),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
          Directionality(textDirection: TextDirection.rtl,
              child: const DetailsScreen()),
          theme: getApplicationTheme(),

        );
      },

    );
  }
}

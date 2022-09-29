
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconComponent extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final Color iconColor;

 const IconComponent({required this.width,required this.height,required this.imagePath, this.iconColor:Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width:width ,
        height:height ,
        child:  SvgPicture.asset(imagePath,
          color: iconColor,
        ),
      ),
    );
  }
}

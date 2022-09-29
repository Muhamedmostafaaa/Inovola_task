
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovola_task/core/utils/colors_manager.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 142.h,
        color: ColorManager.buttonColor,
        child: TextButton(
          onPressed: () {},
          child: Text(
            'قم بالحجز الآن',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ));
  }
}

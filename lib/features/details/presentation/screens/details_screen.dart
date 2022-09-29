import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovola_task/core/services/service_locator.dart';
import 'package:inovola_task/core/utils/Strings_manager.dart';
import 'package:inovola_task/core/utils/colors_manager.dart';
import 'package:inovola_task/features/details/presentation/components/button_component.dart';
import 'package:inovola_task/features/details/presentation/components/divider_component.dart';
import 'package:inovola_task/features/details/presentation/components/icon_component.dart';
import 'package:inovola_task/features/details/presentation/controller/details_cubit.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DetailsCubit>()..getDetails(),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<DetailsCubit>(context);
          PageController controller = PageController();

          if (cubit.details != null) {
            return Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: double.infinity,
                    height: 675.h,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        cubit.currentIndex = index;
                      },
                      reverse: true,
                      controller: controller,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Image.asset(
                              cubit.images[index],
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 98.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 45.w),
                                  child: Row(
                                    children: [
                                      IconComponent(
                                          width: 24.w,
                                          height: 36.h,
                                          imagePath: StringsManager.arrowIcon),
                                      const Spacer(),
                                      IconComponent(
                                          width: 51.w,
                                          height: 53.h,
                                          imagePath: StringsManager.shareIcon),
                                      SizedBox(
                                        width: 57.w,
                                      ),
                                      IconComponent(
                                          width: 54.w,
                                          height: 52.h,
                                          imagePath: StringsManager.saveIcon),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 35.h, left: 45.h),
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      for (int i = 0;
                                          i < cubit.images.length;
                                          i++)
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: cubit.getCircularIndicatoer(i),
                                        )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      },
                      itemCount: cubit.images.length,
                    ),
                  ),

                  Container(
                      width: double.infinity,
                      height: 384.h,
                      margin: EdgeInsets.only(right: 44.7.w, bottom: 29.1.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            '${cubit.details!.interest} #',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Text(
                            cubit.details!.reservTypes[0].name,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Row(
                            children: [
                              IconComponent(
                                width: 43.w,
                                height: 40.h,
                                imagePath: StringsManager.dateIcon,
                                iconColor: ColorManager.iconColor,
                              ),
                              SizedBox(
                                width: 21.w,
                              ),
                              Text(
                                '${DateFormat('yyyy HH:mm:ss dd MMM EEE ').format(DateTime.parse(cubit.details!.date))}ً',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconComponent(
                                width: 40.w,
                                height: 40.h,
                                imagePath: StringsManager.addressIcon,
                                iconColor: ColorManager.iconColor,
                              ),
                              SizedBox(
                                width: 21.w,
                              ),
                              Text(
                                cubit.details!.address,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                        ],
                      )),
                  const DividerComponent(),

                  Container(
                    margin:
                        EdgeInsets.only(right: 45.w, left: 54.w, bottom: 15.h),
                    width: double.infinity,
                    height: 234.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage(
                                StringsManager.trainerPhoto,
                              ),
                            ),
                            SizedBox(
                              width: 28.9.w,
                            ),
                            Text(
                              cubit.details!.trainerName,
                              style: Theme.of(context).textTheme.displayMedium,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          cubit.details!.trainerInfo,
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                      ],
                    ),
                  ),
                  const DividerComponent(),

                  Container(
                    margin: EdgeInsets.only(
                        right: 45.w, left: 54.w, bottom: 14.5.h),
                    width: double.infinity,
                    height: 328.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'عن الدورة',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Expanded(
                          child: Text(
                            cubit.parsingString(cubit.details!.occasionDetail),
                            style: Theme.of(context).textTheme.displaySmall,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  const DividerComponent(),
                  //top: 18.9.h
                  Container(
                    margin: EdgeInsets.only(right: 45.w, left: 44.5.w),
                    width: double.infinity,
                    height: 280.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'تكلفة الدورة',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Row(
                          children: [
                            Text(
                              'الحجز العادي',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const Spacer(),
                            Text(
                              '${cubit.details!.reservTypes[0].count} SAR',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'الحجز المميز ',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const Spacer(),
                            Text(
                              '${cubit.details!.reservTypes[0].price} SAR',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'الحجز السريع ',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const Spacer(),
                            Text(
                              '${cubit.details!.reservTypes[0].id} SAR',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),

                  const ButtonComponent()
                ],
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

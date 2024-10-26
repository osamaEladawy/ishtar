import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/custom_appBar.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/home/cubit/home_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              CustomAppBar(
                logo: false,
                title: LocaleKeys.hospital.tr(),
              ),
              SizedBox(height: 21.h),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: HomeCubit.instance.hospitals.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      HomeCubit.instance.map[HomeCubit
                              .instance.hospitals[index].id
                              .toString()] =
                          HomeCubit.instance.hospitals[index].isFavorite;
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Card(
                          color: Color(0xffFFFFFF),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.asset(
                                  HomeCubit.instance.hospitals[index].image,
                                  height: 100.h,
                                  width: 149.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 8.w, left: 8.w),
                                child: TextWidget(
                                  HomeCubit.instance.hospitals[index].name,
                                  textAlign: TextAlign.right,
                                  textStyle: AppTextStyle.textStyle(
                                    appFontSize: 13.sp,
                                    appFontWeight: FontWeight.w600,
                                    appFontHeight: 24.36.sp,
                                    color: Color(0xff111111),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.79.h),
                              Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 8.w, left: 8.w),
                                child: TextWidget(
                                  HomeCubit.instance.hospitals[index].category,
                                  textAlign: TextAlign.right,
                                  textStyle: AppTextStyle.textStyle(
                                    appFontSize: 12.sp,
                                    appFontWeight: FontWeight.w500,
                                    appFontHeight: 22.49.sp,
                                    color: Color(0xff66666E),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.79.h),
                              Container(
                                margin: EdgeInsets.only(right: 8.w, left: 8.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(IconsManger.routing),
                                    SizedBox(width: 5.17.w),
                                    TextWidget(
                                      HomeCubit
                                          .instance.hospitals[index].address,
                                      textAlign: TextAlign.right,
                                      textStyle: AppTextStyle.textStyle(
                                        appFontSize: 12.sp,
                                        appFontWeight: FontWeight.w500,
                                        appFontHeight: 22.49.sp,
                                        color: Color(0xff66666E),
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        HomeCubit.instance.selectedItem = index;
                                        if (HomeCubit.instance.selectedItem ==
                                            index) {
                                          HomeCubit.instance
                                              .selectFavorite(index);
                                        }
                                        // if (HomeCubit.instance.map[HomeCubit
                                        //         .instance.hospitals[index].id
                                        //         .toString()] ==
                                        //     true) {
                                        //   HomeCubit.instance.favItem(
                                        //       HomeCubit
                                        //           .instance.hospitals[index].id
                                        //           .toString(),
                                        //       false);
                                        // } else {
                                        //   HomeCubit.instance.favItem(
                                        //       HomeCubit
                                        //           .instance.hospitals[index].id
                                        //           .toString(),
                                        //       true);
                                        // }
                                        // // HomeCubit.instance.selectFavorite(index);
                                      },
                                      child: HomeCubit.instance.isFav &&
                                              HomeCubit.instance.selectedItem ==
                                                  index
                                          ? SvgPicture.asset(IconsManger.hearts)
                                          : SvgPicture.asset(IconsManger.heart),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}

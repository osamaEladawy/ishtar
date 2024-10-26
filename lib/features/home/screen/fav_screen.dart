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

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
            child: Column(
              children: [
                CustomAppBar(title: LocaleKeys.favorites.tr(), logo: false),
                SizedBox(height: 21.h),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100.h,
                        child: Card(
                          color: Color(0xffFFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.asset(
                                  HomeCubit.instance.models[index].image,
                                  height: 84.h,
                                  width: 101.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    HomeCubit
                                        .instance.models[index].name,
                                    textAlign: TextAlign.right,
                                    textStyle: AppTextStyle.textStyle(
                                      appFontSize: 13.sp,
                                      appFontWeight: FontWeight.w600,
                                      appFontHeight: 24.36.sp,
                                      color: Color(0xff111111),
                                    ),
                                  ),
                                  TextWidget(
                                    HomeCubit.instance.models[index].category,
                                    textAlign: TextAlign.right,
                                    textStyle: AppTextStyle.textStyle(
                                      appFontSize: 12.sp,
                                      appFontWeight: FontWeight.w500,
                                      appFontHeight: 22.49.sp,
                                      color: Color(0xff66666E),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(IconsManger.routing),
                                      SizedBox(width: 5.17.w),
                                      TextWidget(
                                        HomeCubit.instance.models[index]
                                            .address,
                                        textAlign: TextAlign.right,
                                        textStyle: AppTextStyle.textStyle(
                                          appFontSize: 12.sp,
                                          appFontWeight: FontWeight.w500,
                                          appFontHeight: 22.49.sp,
                                          color: Color(0xff66666E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  GestureDetector(
                                    child:
                                        SvgPicture.asset(IconsManger.deletee),
                                  ),
                                  SizedBox(height: 10.h),
                                  GestureDetector(
                                    child: SvgPicture.asset(IconsManger.hearts),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: HomeCubit.instance.models.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:ishtar/features/profile/cubit/profile_cubit.dart';
import 'package:ishtar/features/profile/widget/custom_card.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class ChooseAreaScreen extends StatelessWidget {
  const ChooseAreaScreen({super.key, this.cityName = ""});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  CustomAppBarAuth(isNotAuth: true),
                  SizedBox(height: 9.h),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 20.w),
                    child: TextWidget(
                      LocaleKeys.chooseArea.tr(),
                      textAlign: TextAlign.right,
                      textStyle: AppTextStyle.textStyle(
                        appFontSize: 13.sp,
                        appFontHeight: 24.36.sp,
                        appFontWeight: FontWeight.w700,
                        color: const Color(0xff010101),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff5A5A5A).withOpacity(0.1),
                          blurRadius: 13,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CustomTextField(
                        isChat: true,
                        hintText: LocaleKeys.searchByRegionName.tr()),
                  ),
                  SizedBox(height: 17.h),
                  Container(
                    height: 60.h,
                    width: 360.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.r),
                      border: Border.all(
                        color: const Color(0xffFFFFFF),
                      ),
                      color: const Color(0xffFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff5A5A5A).withOpacity(0.3),
                          blurRadius: 7,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 18.w),
                            SvgPicture.asset(IconsManger.tick_square),
                            SizedBox(width: 16.w),
                            Image.asset(ImageManger.egypt),
                            SizedBox(width: 20.w),
                            TextWidget("مصر"),
                          ],
                        ),
                        SizedBox(width: 36.34.w),
                        Image.asset(ImageManger.lineV),
                        SizedBox(width: 17.5.w),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(IconsManger.tick_square),
                            SizedBox(width: 16.w),
                            SvgPicture.asset(IconsManger.loc),
                            SizedBox(width: 16.w),
                            TextWidget(
                              cityName,
                              textStyle: AppTextStyle.textStyle(
                                inter: true,
                                appFontSize: 17.sp,
                                appFontHeight: 20.57.sp,
                                appFontWeight: FontWeight.w400,
                                color: Color(0xff020202),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(width: 39.74.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 11.h),
                  Divider(height: 1.h,color: Color(0xffE3E3E3)),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: ProfileCubit.instance.areas.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.selectYourLocation);
                          },
                          child: CustomCard(
                              cityName: ProfileCubit.instance.areas[index]),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 10.h),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

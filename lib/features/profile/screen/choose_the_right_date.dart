import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/profile/cubit/profile_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class ChooseTheRightDate extends StatelessWidget {
  const ChooseTheRightDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: SvgPicture.asset(
          IconsManger.iconLogo,
          height: 30.51.h,
          width: 102.w,
          color: Color(0xff051336),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 20.w),
              child: SvgPicture.asset(
                IconsManger.arrow,
                height: 21.6.h,
                width: 12.69.w,
                color: Color(0xff555555),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextWidget(
                LocaleKeys.chooseTheRightDate.tr(),
                textAlign: TextAlign.center,
                textStyle: AppTextStyle.textStyle(
                  appFontSize: 14.sp,
                  appFontHeight: 16.sp,
                  appFontWeight: FontWeight.w700,
                  color: const Color(0xff323232),
                ),
              ),
            ),
            SizedBox(height: 14.h),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 17.h,
                      width: 17.37.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageManger.rectangle31),
                        ),
                      ),
                      child: SvgPicture.asset(IconsManger.Vector_r),
                    ),
                    SizedBox(width: 5.w),
                    SizedBox(
                      height: 140.h,
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: ListView.separated(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: ProfileCubit.instance.dates.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 80.w,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 79.11.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xff188DFF),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6.r),
                                      topRight: Radius.circular(6.r),
                                    ),
                                  ),
                                  child: TextWidget(
                                    ProfileCubit.instance.dates[index].day,
                                    textAlign: TextAlign.center,
                                    textStyle: AppTextStyle.textStyle(
                                      appFontSize: 12.sp,
                                      appFontHeight: 22.49.sp,
                                      appFontWeight: FontWeight.w400,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 75.h,
                                  width: 80.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFFFFFF),
                                    border: Border(
                                      right: BorderSide(
                                        color: Color(0xff979797C2),
                                        width: 1.w,
                                      ),
                                      left: BorderSide(
                                        color: Color(0xff979797C2),
                                        width: 1.w,
                                      ),
                                    ),
                                  ),
                                  child: index == 2
                                      ? TextWidget(
                                          "لا توجد مواعيد متاحة",
                                          textStyle: AppTextStyle.textStyle(
                                            appFontSize: 12.sp,
                                            appFontHeight: 16.sp,
                                            appFontWeight: FontWeight.w400,
                                            color: Color(0xff000000),
                                          ),
                                        )
                                      : Image.asset(ImageManger.times),
                                ),
                                Container(
                                  height: 30.h,
                                  width: 79.11.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ProfileCubit
                                            .instance.dates[index].isReservation
                                        ? Color(0xff1350A3)
                                        : Color(0xffB1B1B1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6.r),
                                      bottomRight: Radius.circular(6.r),
                                    ),
                                  ),
                                  child: TextWidget(
                                    ProfileCubit
                                        .instance.dates[index].reservation,
                                    textAlign: TextAlign.center,
                                    textStyle: AppTextStyle.textStyle(
                                      appFontSize: 12.sp,
                                      appFontHeight: 22.49.sp,
                                      appFontWeight: FontWeight.w400,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(width: 5.w),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      height: 17.h,
                      width: 17.37.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageManger.rectangle31),
                        ),
                      ),
                      child: SvgPicture.asset(IconsManger.Vector_l),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 30.h),
            Container(
              height: 106.h,
              width: 306.w,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.r),
                border: Border.all(
                  color: Color(0xffFFFFFF),
                ),
                color: Color(0xffFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff5A5A5A).withOpacity(0.2),
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  hintStyle: AppTextStyle.textStyle(
                    appFontSize: 12.sp,
                    appFontHeight: 16.sp,
                    appFontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                  ),
                  hintText: LocaleKeys.addAnyDetails.tr(),
                  filled: true,
                  fillColor: Color(0xffFFFFFF),
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
              alignment: Alignment.center,
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(ProfileCubit.instance.categories.length,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            ProfileCubit.instance.selectCategory(index);
                          },
                          child: TypeButtons(
                            title: ProfileCubit.instance.categories[index],
                            colorContainer:
                                ProfileCubit.instance.selectedCategory == index
                                    ? Color(0xff188DFF)
                                    : Color(0xffF0F0F0),
                            colorText:
                                ProfileCubit.instance.selectedCategory == index
                                    ? Color(0xffFFFFFF)
                                    : Color(0xff020202),
                          ),
                        );
                      })
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypeButtons extends StatelessWidget {
  const TypeButtons({
    super.key,
    required this.title,
    required this.colorContainer,
    required this.colorText,
  });

  final String title;
  final Color colorContainer;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 170.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: colorContainer,
      ),
      child: TextWidget(
        title,
        textStyle: AppTextStyle.textStyle(
          appFontSize: 14.sp,
          appFontHeight: 26.24.sp,
          appFontWeight: FontWeight.w700,
          color: colorText,
        ),
      ),
    );
  }
}

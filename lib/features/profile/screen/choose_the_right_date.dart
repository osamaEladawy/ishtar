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
          child: Container(
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
            SizedBox(),
            SizedBox(height: 30.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
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
      )),
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
      height: 38.h,
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

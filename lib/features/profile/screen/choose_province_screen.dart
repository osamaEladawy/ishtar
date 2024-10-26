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

class ChooseProvinceScreen extends StatelessWidget {
  const ChooseProvinceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  SizedBox(height: 9.h),
                  CustomAppBarAuth(isNotAuth: true),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 20.w),
                    child: TextWidget(
                      LocaleKeys.chooseTheProvince.tr(),
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
                          color: const Color(0xff0000000F).withOpacity(0.2),
                          blurRadius: 9,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CustomTextField(
                        isChat: true,
                        hintText: LocaleKeys.searchByGovernorateName.tr()),
                  ),
                  SizedBox(height: 17.h),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60.h,
                      width: 360.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.r),
                        border: Border.all(
                          color: Color(0xffFFFFFF),
                        ),
                        color: Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff0000000F).withOpacity(0.2),
                            blurRadius: 17,
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(IconsManger.tick_square),
                            SizedBox(width: 16.w),
                            Image.asset(ImageManger.egypt),
                            SizedBox(width: 20.w),
                            TextWidget("مصر"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: ProfileCubit.instance.cities.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.chooseAreaScreen,
                              arguments: ProfileCubit.instance.cities[index],
                            );
                          },
                          child: CustomCard(
                            cityName: ProfileCubit.instance.cities[index],
                          ),
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
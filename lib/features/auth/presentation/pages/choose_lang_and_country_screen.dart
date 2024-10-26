import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/custom_appBar.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/auth/cubit/auth_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class ChooseLangAndCountryScreen extends StatelessWidget {
  const ChooseLangAndCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h),
        child: Column(
          children: [
            CustomAppBar(
              title: LocaleKeys.chooseCountry.tr(),
            ),
            SizedBox(height: 21.h),
            Container(
              alignment: Alignment.topRight,
              child: TextWidget(
                LocaleKeys.chooseLanguage.tr(),
                textAlign: TextAlign.right,
                textStyle: AppTextStyle.textStyle(
                  appFontSize: 13.sp,
                  appFontHeight: 24.36.sp,
                  appFontWeight: FontWeight.w700,
                  color: const Color(0xff010101),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(AuthCubit.instance.langs.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          AuthCubit.instance.selectLanguage(index);
                        },
                        child: Container(
                          height: 38.h,
                          width: 170.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19.r),
                            color: AuthCubit.instance.selectLang == index
                                ? const Color(0xff188DFF)
                                : const Color(0xffF7F5F9),
                          ),
                          child: TextWidget(
                            AuthCubit.instance.langs[index],
                            textAlign: TextAlign.center,
                            textStyle: AppTextStyle.textStyle(
                              appFontSize: 14.sp,
                              appFontHeight: 28.24.sp,
                              appFontWeight: FontWeight.w700,
                              color: AuthCubit.instance.selectLang == index
                                  ? const Color(0xffFFFFFF)
                                  : const Color(0xff020202),
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                );
              },
            ),
            SizedBox(height: 27.h),
            Container(
              alignment: Alignment.topRight,
              child: TextWidget(
                LocaleKeys.chooseCountry.tr(),
                textAlign: TextAlign.right,
                textStyle: AppTextStyle.textStyle(
                  appFontSize: 13.sp,
                  appFontHeight: 24.36.sp,
                  appFontWeight: FontWeight.w700,
                  color: const Color(0xff010101),
                ),
              ),
            ),
            SizedBox(height: 19.h),
            CustomTextField(hintText: LocaleKeys.searchByNameCountry.tr()),
            SizedBox(height: 26.h),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: AuthCubit.instance.countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              AuthCubit.instance.selectCountry(index);
                              if (AuthCubit.instance.selectCountries == index) {
                                Navigator.pushNamed(
                                  context,
                                  Routes.loginScreen,
                                  arguments:
                                      AuthCubit.instance.countries[index],
                                );
                              }
                            },
                            child: Container(
                              height: 24.h,
                              width: 24.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                  color: const Color(0xff188DFF),
                                  width: 1.7.w,
                                ),
                              ),
                              child: AuthCubit.instance.selectCountries == index
                                  ? SvgPicture.asset(IconsManger.check)
                                  : null,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Image.asset(AuthCubit.instance.countries[index].flag),
                          SizedBox(width: 19.66.w),
                          TextWidget(
                            AuthCubit.instance.countries[index].name,
                            textStyle: AppTextStyle.textStyle(
                              appFontSize: 17.sp,
                              appFontHeight: 31.86.sp,
                              appFontWeight: FontWeight.w600,
                              color: const Color(0xff020202),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: 17.h,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}

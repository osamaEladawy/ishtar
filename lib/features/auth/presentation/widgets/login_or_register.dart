import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/common/widget/custom_container_ishtar.dart';
import 'package:ishtar/common/widget/custom_field_phone_number.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/primary_button.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/auth/cubit/auth_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({super.key, this.isLogin = true});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 121.h),
          const CustomContainerIshtar(),
          SizedBox(height: 51.h),
          TextWidget(
            LocaleKeys.welcome.tr(),
            textStyle: AppTextStyle.textStyle(
                appFontSize: 19.sp,
                appFontHeight: 35.61.sp,
                appFontWeight: FontWeight.w600,
                color: const Color(0xff000000)),
          ),
          TextWidget(
            LocaleKeys.enterYourPhoneNumberToLogin.tr(),
            textStyle: AppTextStyle.textStyle(
                appFontSize: 13.sp,
                appFontHeight: 24.36.sp,
                appFontWeight: FontWeight.w500,
                color: const Color(0xff000000)),
          ),
          if (!isLogin) SizedBox(height: 13.h),
          if (!isLogin)
            Align(
              alignment: Alignment.topRight,
              child: TextWidget(
                LocaleKeys.phoneNumber.tr(),
                textStyle: AppTextStyle.textStyle(
                    appFontSize: 13.sp,
                    appFontHeight: 24.36.sp,
                    appFontWeight: FontWeight.w700,
                    color: const Color(0xff000000)),
              ),
            ),
          if (isLogin) SizedBox(height: 47.h),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return CustomTextField(
                hintText: LocaleKeys.password.tr(),
                onPressedSuffixIcon: () {
                  AuthCubit.instance.showPassword();
                },
                obscureText: AuthCubit.instance.isDisabled,
                icon: AuthCubit.instance.icon(),
              );
            },
          ),
          SizedBox(height: 18.h),
          CustomFieldPhoneNumber(
            valueChanged: (String value) {},
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      AuthCubit.instance.checkBox();
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
                      child: AuthCubit.instance.value
                          ? SvgPicture.asset(IconsManger.check)
                          : null,
                      // child: Checkbox(
                      //     activeColor: Colors.transparent,
                      //     checkColor: const Color(0xff188DFF),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(6.r),
                      //       side: BorderSide(
                      //         color: const Color(0xff188DFF),
                      //         width: 5.w,
                      //       ),
                      //     ),
                      //     value: AuthCubit.instance.value,
                      //     onChanged: (value) {
                      //       AuthCubit.instance.checkBox(value!);
                      //     }),
                    ),
                  );
                },
              ),
              SizedBox(width: 5.w),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: LocaleKeys.iAgreeToAll.tr(),
                      style: AppTextStyle.textStyle(
                        appFontSize: 13.sp,
                        appFontHeight: 24.36.sp,
                        appFontWeight: FontWeight.w500,
                        // color: Color(0xff188DFF),
                      ),
                    ),
                    TextSpan(
                      text: LocaleKeys.termsAndConditions.tr(),
                      style: AppTextStyle.textStyle(
                        appFontSize: 13.sp,
                        appFontHeight: 24.36.sp,
                        appFontWeight: FontWeight.w500,
                        color: const Color(0xff188DFF),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          PrimaryButton(
            title: LocaleKeys.continuee.tr(),
            onTap: () {
              if (isLogin) {
                Navigator.pushNamed(context, Routes.verificationCodeScreen);
              } else {
                Navigator.pushNamed(context, Routes.verificationCodeScreen);
              }
            },
          ),
          if (!isLogin) SizedBox(height: 17.h),
          if (!isLogin)
            TextWidget(
              LocaleKeys.or.tr(),
              textStyle: AppTextStyle.textStyle(
                appFontSize: 13.sp,
                appFontHeight: 24.36.sp,
                appFontWeight: FontWeight.w500,
                color: const Color(0xff000000),
              ),
            ),
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: SvgPicture.asset(IconsManger.google),
              ),
              isLogin ? SizedBox(width: 88.w) : SizedBox(width: 54.h),
              GestureDetector(
                child: SvgPicture.asset(IconsManger.facebook),
              ),
              if (!isLogin) SizedBox(width: 54.h),
              if (!isLogin)
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageManger.instaaaa),
                      ),
                    ),
                    child: Image.asset(
                      ImageManger.insta,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

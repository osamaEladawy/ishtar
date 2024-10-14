import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/custom_container_ishtar.dart';
import 'package:ishtar/common/widget/custom_field_phone_number.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/primary_button.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

import '../cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 40.w),
          alignment: Alignment.center,
          child: SingleChildScrollView(
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
                SizedBox(height: 47.h),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return CustomTextField(
                        hintText: "كلمة السر",
                        onPressed: () {
                          AuthCubit.instance.showPassword();
                          setState(() {});
                        },
                        obscureText: AuthCubit.instance.isDisabled,
                        icon: AuthCubit.instance.icon());
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
                            setState(() {});
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
                            text: "أوافق علي جميع ",
                            style: AppTextStyle.textStyle(
                              appFontSize: 13.sp,
                              appFontHeight: 24.36.sp,
                              appFontWeight: FontWeight.w500,
                              // color: Color(0xff188DFF),
                            ),
                          ),
                          TextSpan(
                            text: " الشروط والأحكام",
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
                  title: "متابعه",
                  onTap: () {},
                ),
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(IconsManger.google),
                    ),
                    SizedBox(width: 88.w),
                    GestureDetector(
                      child: SvgPicture.asset(IconsManger.facebook),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

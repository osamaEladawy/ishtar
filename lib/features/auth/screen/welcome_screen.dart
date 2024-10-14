import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/custom_container_ishtar.dart';
import 'package:ishtar/common/widget/primary_button.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
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
              SizedBox(height: 51.h),
              PrimaryButton(
                title: LocaleKeys.user.tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
                },
              ),
              SizedBox(height: 9.h),
              PrimaryButton(
                title: LocaleKeys.serviceProvider.tr(),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

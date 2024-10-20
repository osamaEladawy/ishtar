import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/primary_button.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/translations/locale_keys.g.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 67.67.h),
              Image.asset(ImageManger.lock),
              SizedBox(height: 28.h),
              TextWidget(
                LocaleKeys.verification.tr(),
                textAlign: TextAlign.center,
                textStyle: AppTextStyle.textStyle(
                  appFontSize: 18.sp,
                  appFontWeight: FontWeight.w600,
                  appFontHeight: 28.sp,
                  color: const Color(0xff000000),
                ),
              ),
              SizedBox(height: 12.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: LocaleKeys.sentTo.tr(),
                      style: AppTextStyle.textStyle(
                        appFontSize: 13.sp,
                        appFontWeight: FontWeight.w400,
                        appFontHeight: 24.36.sp,
                        color: const Color(0xff989898),
                      ),
                    ),
                    TextSpan(
                      text: " +020254521124",
                      style: AppTextStyle.textStyle(
                        appFontSize: 13.sp,
                        appFontWeight: FontWeight.w400,
                        appFontHeight: 24.36.sp,
                        color: const Color(0xff989898),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 19.h),
              Container(
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  length: 5,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 59.h,
                    fieldWidth: 59.w,
                    activeColor: Theme.of(context).primaryColor,
                    //selectedColor: Color(0xffB9B9B9),
                    inactiveColor: Color(0xffF1F1F1),
                    activeBoxShadow: [
                      BoxShadow(
                        color: Color(0xffF1F1F1),
                        offset: Offset(0, 3),
                        spreadRadius: 5.1,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 5,
                      ),
                      // box-shadow: 0px 3px 3px 0px #0000000D;
                    ],

                    activeFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    // setState(() {
                    //   currentText = value;
                    // });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
              ),
              SizedBox(height: 17.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${LocaleKeys.didNotReceiveTheCode.tr()}؟",
                      style: AppTextStyle.textStyle(
                        appFontSize: 13.sp,
                        appFontHeight: 24.36.sp,
                        appFontWeight: FontWeight.w400,
                        color: const Color(0xff989898),
                      ),
                    ),
                    TextSpan(
                      text: LocaleKeys.sendAgain.tr(),
                      style: AppTextStyle.textStyle(
                        appFontSize: 13.sp,
                        appFontHeight: 24.36.sp,
                        appFontWeight: FontWeight.w600,
                        color: const Color(0xff188DFF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 29.h),
              PrimaryButton(
                title: LocaleKeys.login.tr(),
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.homeTapScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "welcome": "مرحبا بك",
  "user": "مستخدم",
  "serviceProvider": " مزود خدمة",
  "enterYourPhoneNumberToLogin": "ادخل رقم الهاتف لتسجيل الدخول / انشاء حساب للمتابعة",
  "verification": "لقد تم ارسال لك رمز التحقق علي رقم الهاتف الخاص بك",
  "didNotReceiveTheCode": "لم يصل الكود اليك",
  "sendAgain": " ارسال مرة اخري",
  "login": "تسجيل دخول",
  "continue": "استمرار",
  "termsAndConditions": " الشروط والأحكام",
  "iAgreeToAll": "أوافق علي جميع ",
  "password": "كلمة السر"
};
static const Map<String,dynamic> en = {
  "welcome": "Welcome",
  "user": "User",
  "serviceProvider": "Service Provider",
  "enterYourPhoneNumberToLogin": "Enter your phone number to log in / create an account to continue",
  "verification": "A verification code has been sent to your phone number.",
  "didNotReceiveTheCode": "Didn't receive the code",
  "sendAgain": "Send again",
  "login": "Login",
  "continue": "Continue",
  "password": "Password",
  "termsAndConditions": "Terms and Conditions",
  "iAgreeToAll": "I agree to All"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}

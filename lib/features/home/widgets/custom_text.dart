import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: 299.w,
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: Image.asset(
            ImageManger.egypt,
            height: 24.h,
            width: 24.w,
          ),
          contentPadding: EdgeInsets.only(
            top: 14.h,
            bottom: 6.h,
            right: 60.w,
          ),
          hintStyle: AppTextStyle.textStyle(
            appFontSize: 13.sp,
            appFontHeight: 24.36.sp,
            appFontWeight: FontWeight.w400,
            color: Color(0xffC3CBD3),
          ),
          hintText: hintText,
          filled: true,
          fillColor: Color(0xffF8FAF9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(
              color: Color(0xffF8FAF9),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(
              color: Color(0xffF8FAF9),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(
              color: Color(0xffF8FAF9),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/config/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onPressedSuffixIcon;
  final void Function()? onPressedPrefixIcon;
  final void Function(String)? onFieldSubmitted;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final bool isHome;
  final bool isAUth;
  final bool isChat;
  final bool isChatInfo;
  final Widget? searchWidget;
  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.validator,
    this.hintText,
    this.obscureText = false,
    this.icon,
    this.onChanged,
    this.keyboardType,
    this.prefixIcon,
    this.isHome = false,
    this.onPressedSuffixIcon,
    this.onPressedPrefixIcon,
    this.searchWidget,
    this.isChat = false,
    this.isChatInfo = false,
    this.onFieldSubmitted,
    this.isAUth = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isHome
          ? 40.h
          : isChat
              ? 44.h
              : isChatInfo
                  ? 52.h
                  : 48.h,
      width: isHome
          ? 296.w
          : isChat
              ? 350.w
              : isChatInfo
                  ? 350.w
                  : null,
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText == false ? true : false,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: isChat
              ? EdgeInsets.only(bottom: 6.h, top: 14.h, right: 54.w)
              : EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: isHome
                ? BorderRadius.circular(8.r)
                : isChatInfo
                    ? BorderRadius.circular(26.r)
                    : BorderRadius.circular(4.r),
            borderSide: BorderSide(
              color: const Color(0xffE2E2E2),
              width: 1.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: isHome
                ? BorderRadius.circular(8.r)
                : isChatInfo
                    ? BorderRadius.circular(26.r)
                    : BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: Color(0xffE2E2E2),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: isHome
                ? BorderRadius.circular(8.r)
                : isChatInfo
                    ? BorderRadius.circular(26.r)
                    : BorderRadius.circular(4.r),
            borderSide: BorderSide(
              color: const Color(0xffE2E2E2),
              width: 1.w,
            ),
          ),
          filled: true,
          fillColor: isHome
              ? Color(0xff020202).withOpacity(0.05)
              : isChat
                  ? Color(0xffFFFFFF)
                  : isChatInfo
                      ? Color(0xffF7F5F9)
                      : const Color(0xffF7F5F9),
          labelText: labelText,
          hintText: hintText,
          hintStyle: isHome
              ? AppTextStyle.textStyle(
                  inter: true,
                  appFontSize: 13.sp,
                  appFontWeight: FontWeight.w400,
                  appFontHeight: 15.73.sp,
                  color: Color(0xffFFFFFF),
                )
              : isChat
                  ? AppTextStyle.textStyle(
                      appFontSize: 13.sp,
                      appFontWeight: FontWeight.w400,
                      appFontHeight: 24.36.sp,
                      color: Color(0xffC3CBD3))
                  : TextStyle(),
          prefixIcon: IconButton(
            onPressed: onPressedPrefixIcon,
            icon: Icon(
              prefixIcon,
              color: isHome ? Color(0xffFFFFFF) : null,
            ),
          ),
          suffixIcon: isHome
              ? searchWidget
              : IconButton(
                  onPressed: onPressedSuffixIcon,
                  icon: Icon(
                    icon,
                    color: const Color(0xffB0B0B0),
                    size: 20.sp,
                  ),
                ),
        ),
      ),
    );
  }
}

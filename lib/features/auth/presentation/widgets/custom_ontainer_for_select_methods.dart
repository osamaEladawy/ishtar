import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';

class CustomContainerForSelectMethods extends StatelessWidget {
  const CustomContainerForSelectMethods({
    super.key,
    required this.title,
    required this.isWidth,
    required this.color,
    required this.colorText,
    required this.image,
    // required this.isRegister,
  });
  final String title;
  final String image;
  final bool isWidth;
  final Color color;
  final Color colorText;
  // final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 38.h,
      width: isWidth ? 170.w : null,
      padding: isWidth ? EdgeInsets.zero : EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: color,
        // Color(0xffF7F5F9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            color: colorText,
            //width: 30,
          ),
          SizedBox(width: isWidth ? 29.86.w : 11.w),
          TextWidget(
            title,
            textAlign: TextAlign.center,
            textStyle: AppTextStyle.textStyle(
              appFontSize: isWidth ? 16.sp : 13.sp,
              appFontWeight: isWidth ? FontWeight.w500 : FontWeight.w700,
              appFontHeight: isWidth ? 26.24.sp : 24.36.sp,
              color: colorText,
            ),
          ),
        ],
      ),
    );
  }
}

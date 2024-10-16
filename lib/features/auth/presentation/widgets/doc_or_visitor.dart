import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';

class DoctorOrVisitor extends StatelessWidget {
  const DoctorOrVisitor({
    super.key,
    required this.title,
    required this.color,
    this.isWidth = false,
    required this.colorText,
    this.colorIcon,
    this.isLogin = true,
  });
  final String title;
  final Color color;
  final Color colorText;
  final Color? colorIcon;
  final bool isWidth;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 38.h,
      width: isWidth ? 170.w : 107.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: color,
        // Color(0xffF7F5F9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isLogin) Icon(Icons.shop_sharp, color: colorText),
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

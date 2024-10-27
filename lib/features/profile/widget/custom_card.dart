import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.cityName});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87.h,
      width: 178.w,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 106.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.r),
        border: Border.all(
          color: const Color(0xffFFFFFF),
        ),
        color: const Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff5A5A5A).withOpacity(0.3),
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(IconsManger.loc),
          SizedBox(height: 7.5.h),
          TextWidget(
            cityName,
            textStyle: AppTextStyle.textStyle(
              inter: true,
              appFontSize: 17.sp,
              appFontWeight: FontWeight.w400,
              appFontHeight: 20.57.sp,
              color: Color(0xff020202),
            ),
          ),
        ],
      ),
    );
  }
}

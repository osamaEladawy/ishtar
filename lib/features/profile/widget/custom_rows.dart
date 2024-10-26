import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';

class CustomRows extends StatelessWidget {
  const CustomRows({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: 344.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff0000000F).withOpacity(0.2),
            blurRadius: 13,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 12.5.w),
            child: SvgPicture.asset(IconsManger.loc),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextWidget(
              title,
              textAlign: TextAlign.right,
              textStyle: AppTextStyle.textStyle(
                roboto: true,
                appFontSize: 18.sp,
                appFontHeight: 20.sp,
                appFontWeight: FontWeight.w400,
                color: const Color(0xffB1B1B1),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: SvgPicture.asset(
              IconsManger.arrow,
              height: 17.h,
              width: 10.w,
            ),
          )
        ],
      ),
    );
  }
}

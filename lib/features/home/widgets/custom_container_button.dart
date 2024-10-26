import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';

class CustomContainerButton extends StatelessWidget {
  const CustomContainerButton({
    super.key,
    required this.title,
    required this.image,
    required this.color,
    required this.textColor,
  });
  final String title;
  final String image;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: 170.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image,color: textColor,),
          SizedBox(width: 7.w),
          TextWidget(
            title,
            textStyle: AppTextStyle.textStyle(
              appFontSize: 13.sp,
              appFontHeight: 24.36.sp,
              appFontWeight: FontWeight.w700,
              color: textColor
            ),
          ),
        ],
      ),
    );
  }
}

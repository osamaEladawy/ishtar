import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';

class CustomRightIcons extends StatelessWidget {
  const CustomRightIcons({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });
  final String image;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(image),
        ),
        SizedBox(height: 7.h),
        TextWidget(
          title,
          textStyle: AppTextStyle.textStyle(
            inter: true,
            appFontSize: 12.sp,
            appFontWeight: FontWeight.w400,
            appFontHeight: 14.52.sp,
            color: Color(0xffFFFFFF),
          ),
        ),
      ],
    );
  }
}

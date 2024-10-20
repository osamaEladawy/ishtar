import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';

class CustomContainerHome extends StatelessWidget {
  final String title;
  final bool isChoosePlace;
  const CustomContainerHome({
    super.key,
    required this.title,
    this.isChoosePlace = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      width: 143.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffF0F0F0),
        borderRadius: BorderRadius.circular(19.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isChoosePlace
              ? GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    ImageManger.egypt,
                    height: 26.h,
                    width: 26.w,
                  ),
                )
              : GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    IconsManger.settings,
                    height: 26.h,
                    width: 26.w,
                  ),
                ),
          SizedBox(width: 9.w),
          TextWidget(
            title,
            textAlign: TextAlign.center,
            textStyle: AppTextStyle.textStyle(
              inter: true,
              appFontSize: 14.sp,
              appFontWeight: FontWeight.w700,
              appFontHeight: 24.24.sp,
              color: Color(0xff7B7B7B),
            ),
          ),
        ],
      ),
    );
  }
}

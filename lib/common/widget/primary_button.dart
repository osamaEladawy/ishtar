import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/color_resources.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final bool hasBorder;
  const PrimaryButton(
      {super.key, this.onTap, required this.title, this.hasBorder = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350.w,
        padding: EdgeInsets.symmetric(vertical: 13.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: hasBorder
                ? ColorResources.whiteColor
                : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.sp),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: TextWidget(
          title,
          textAlign: TextAlign.right,
          textStyle: AppTextStyle.textStyle(
            appFontSize: 13.sp,
            appFontWeight: FontWeight.w700,
            appFontHeight: 24.36.sp,
            //color: Color(0xffFFFFFF)
            color: hasBorder
                ? Theme.of(context).primaryColor
                : Theme.of(context).cardColor,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool logo;
  final bool isNotificationScreen;
  const CustomAppBar({
    super.key,
    this.title = "",
    this.logo = true,
    this.isNotificationScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        logo ? SvgPicture.asset(IconsManger.logo) : Container(),
        TextWidget(
          title,
          textAlign: TextAlign.center,
          textStyle: AppTextStyle.textStyle(
            appFontSize: 13.sp,
            appFontHeight: 24.36.sp,
            appFontWeight: FontWeight.w700,
            color: const Color(0xff010101),
          ),
        ),
        isNotificationScreen
            ? SvgPicture.asset(IconsManger.notify)
            : Container(),
      ],
    );
  }
}

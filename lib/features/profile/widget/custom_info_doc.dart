import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class CustomInfoDoc extends StatelessWidget {
  const CustomInfoDoc({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          image,
          height: 24.h,
          color: Color(0xff188DFF),
        ),
        TextWidget(
          title,
          textAlign: TextAlign.center,
          textStyle: AppTextStyle.textStyle(
            appFontSize: 8.sp,
            appFontHeight: 15.sp,
            appFontWeight: FontWeight.w700,
            color: const Color(0xff707070),
          ),
        ),
      ],
    );
  }
}

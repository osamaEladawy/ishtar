import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class CustomRealAppBar extends StatelessWidget {
  const CustomRealAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            LocaleKeys.address.tr(),
            textAlign: TextAlign.center,
            textStyle: AppTextStyle.textStyle(
              appFontSize: 10.sp,
              appFontHeight: 18.74.sp,
              appFontWeight: FontWeight.w600,
              color: const Color(0xff66666E),
            ),
          ),
          TextWidget(
            LocaleKeys.location.tr(),
            textAlign: TextAlign.center,
            textStyle: AppTextStyle.textStyle(
              appFontSize: 10.sp,
              appFontHeight: 18.74.sp,
              appFontWeight: FontWeight.w700,
              color: const Color(0xff010101),
            ),
          ),
        ],
      );
  }
}

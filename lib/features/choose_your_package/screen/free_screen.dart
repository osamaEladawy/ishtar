import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class FreeScreen extends StatelessWidget {
  const FreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 137.h),
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              alignment: Alignment.center,
              height: 107,
              width: 116.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageManger.container),
                ),
              ),
              child: Image.asset(ImageManger.wrong),
            ),
            Positioned(
              right: -22,
              bottom: -80,
              child: Image.asset(ImageManger.hand1),
            ),
          ],
        ),
        SizedBox(height: 80.h),
        TextWidget(
          LocaleKeys.youCannotAddPhotosOrVideos.tr(),
          textAlign: TextAlign.center,
          textStyle: AppTextStyle.textStyle(
              appFontSize: 23.sp,
              appFontWeight: FontWeight.w400,
              appFontHeight: 43.sp,
              color: Color(0xff666666)),
        ),
        TextWidget(
          LocaleKeys.withTheFreePackage.tr(),
          textAlign: TextAlign.center,
          textStyle: AppTextStyle.textStyle(
              appFontSize: 14.sp,
              appFontWeight: FontWeight.w400,
              appFontHeight: 26.24.sp,
              color: Color(0xff666666)),
        )
      ],
    );
  }
}

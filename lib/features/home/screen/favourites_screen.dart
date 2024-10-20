import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/custom_appBar.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: TextWidget(
          LocaleKeys.favorites.tr(),
          textAlign: TextAlign.center,
          textStyle: AppTextStyle.textStyle(
            appFontSize: 13.sp,
            appFontHeight: 24.36.sp,
            appFontWeight: FontWeight.w700,
            color: const Color(0xff010101),
          ),
        ),
        actions: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: SvgPicture.asset(IconsManger.notify)),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        // margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  CustomAppBar(title: LocaleKeys.favorites.tr(), logo: false),
            // SizedBox(height: 196.h),
            Image.asset(ImageManger.click),
            TextWidget(
              LocaleKeys.thereAreNoFavoritesYet.tr(),
              textAlign: TextAlign.center,
              textStyle: AppTextStyle.textStyle(
                inter: true,
                appFontSize: 24.sp,
                appFontHeight: 29.05.sp,
                appFontWeight: FontWeight.w400,
                color: Color(0xff666666),
              ),
            ),
            TextWidget(
              LocaleKeys.goToSearch.tr(),
              textAlign: TextAlign.center,
              textStyle: AppTextStyle.textStyle(
                appFontSize: 14.sp,
                appFontHeight: 16.94.sp,
                appFontWeight: FontWeight.w400,
                color: Color(0xff666666),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

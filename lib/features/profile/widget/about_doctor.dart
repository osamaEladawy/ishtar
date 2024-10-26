import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/common/widget/primary_button.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/profile/cubit/profile_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          TextWidget(
            """استشاري الأمراض الجلدية والتجميل والليزر بمستشفيات القوات المسلحة
      - عضو الاكاديمية الاوروبية للتجميل""",
            textStyle: AppTextStyle.textStyle(
              appFontSize: 12.sp,
              appFontHeight: 22.49.sp,
              appFontWeight: FontWeight.w400,
              color: const Color(0xff999999),
            ),
          ),
          SizedBox(height: 53.h),
          CustomDetailsDoc(
              title: LocaleKeys.doctorName.tr(), subTitle: "osama"),
          CustomDetailsDoc(
              title: LocaleKeys.inquiryNumber.tr(), subTitle: "0202987682"),
          CustomDetailsDoc(
              title: LocaleKeys.whatsAppNumber.tr(), subTitle: "+0127485922"),
          CustomDetailsDoc(
              title: LocaleKeys.email.tr(), subTitle: "osama@gmail.com"),
          CustomDetailsDoc(
              title: LocaleKeys.website.tr(), subTitle: "www.osama.com"),
          SizedBox(height: 8.h),
          Container(
            margin: EdgeInsets.only(bottom: 20.h),
            child: PrimaryButton(
              title: LocaleKeys.showBusinessHours.tr(),
              onTap: () {
                Navigator.pushNamed(context, Routes.chooseTheRightDate);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDetailsDoc extends StatelessWidget {
  const CustomDetailsDoc(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextWidget(
            title,
            textStyle: AppTextStyle.textStyle(
              appFontSize: 12.sp,
              appFontHeight: 22.49.sp,
              appFontWeight: FontWeight.w700,
              color: const Color(0xff000000),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextWidget(
            subTitle,
            textStyle: AppTextStyle.textStyle(
              inter: true,
              appFontSize: 12.sp,
              appFontHeight: 44.sp,
              appFontWeight: FontWeight.w400,
              color: const Color(0xff707070),
            ),
          ),
        ),
      ],
    );
  }
}

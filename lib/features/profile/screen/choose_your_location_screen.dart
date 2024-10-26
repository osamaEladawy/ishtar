import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/primary_button.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:ishtar/features/profile/cubit/profile_cubit.dart';
import 'package:ishtar/features/profile/widget/custom_rows.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class ChooseYourLocationScreen extends StatelessWidget {
  const ChooseYourLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            CustomAppBarAuth(isText: true),
            SizedBox(height: 15.h),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 20.w),
              child: TextWidget(
                LocaleKeys.locateYourLocation.tr(),
                textAlign: TextAlign.right,
                textStyle: AppTextStyle.textStyle(
                  roboto: true,
                  appFontSize: 19.sp,
                  appFontHeight: 20.sp,
                  appFontWeight: FontWeight.w900,
                  color: const Color(0xff5A5A5A),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            CustomRows(title: LocaleKeys.chooseCountry.tr()),
            SizedBox(height: 47.h),
            CustomRows(title: LocaleKeys.chooseTheProvince.tr()),
            SizedBox(height: 47.h),
            CustomRows(title: LocaleKeys.chooseArea.tr()),
            SizedBox(height: 62.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              alignment: Alignment.centerRight,
              child: TextWidget(
                LocaleKeys.searchInARange.tr(),
                textAlign: TextAlign.right,
                textStyle: AppTextStyle.textStyle(
                  roboto: true,
                  appFontSize: 19.sp,
                  appFontHeight: 20.sp,
                  appFontWeight: FontWeight.w900,
                  color: const Color(0xff5A5A5A),
                ),
              ),
            ),
            SizedBox(height: 32.5.h),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Slider(
                  activeColor: Color(0xff188DFF),
                  inactiveColor:
                      //Color(0xffFFFFFF),
                      Color(0xffEAEAEA),
                  min: 0,
                  max: 100,
                  // divisions: 10,
                  value: ProfileCubit.instance.value,
                  onChanged: (value) {
                    ProfileCubit.instance.useSlider(value);
                  },
                );
              },
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 32.h),
              child: PrimaryButton(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.servicesAndSpecializationsScreen,
                  );
                },
                title: LocaleKeys.continuee.tr(),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

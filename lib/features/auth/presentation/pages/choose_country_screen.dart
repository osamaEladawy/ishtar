import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/auth/cubit/auth_cubit.dart';
import 'package:ishtar/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class ChooseCountryScreen extends StatelessWidget {
  const ChooseCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
           CustomAppBarAuth(),
            SizedBox(height: 9.h),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 20.w),
              child: TextWidget(
                LocaleKeys.chooseCountry.tr(),
                textAlign: TextAlign.right,
                textStyle: AppTextStyle.textStyle(
                  appFontSize: 13.sp,
                  appFontHeight: 24.36.sp,
                  appFontWeight: FontWeight.w700,
                  color: const Color(0xff010101),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomTextField(
                  isChat: true, hintText: LocaleKeys.searchByNameCountry.tr()),
            ),
            SizedBox(height: 26.h),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: AuthCubit.instance.countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                AuthCubit.instance.selectedMyCountry(index);
                              },
                              child: Container(
                                height: 24.h,
                                width: 24.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  border: Border.all(
                                    color: const Color(0xff188DFF),
                                    width: 1.7.w,
                                  ),
                                ),
                                child:
                                    AuthCubit.instance.selectMyCountry == index
                                        ? SvgPicture.asset(IconsManger.check)
                                        : null,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Image.asset(
                                AuthCubit.instance.countries[index].flag),
                            SizedBox(width: 19.66.w),
                            TextWidget(
                              AuthCubit.instance.countries[index].name,
                              textStyle: AppTextStyle.textStyle(
                                appFontSize: 17.sp,
                                appFontHeight: 31.86.sp,
                                appFontWeight: FontWeight.w600,
                                color: const Color(0xff020202),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: 17.h,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/custom_appBar.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/features/choose_your_package/cubit/choose_package_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class ChoosePackageScreenOne extends StatelessWidget {
  const ChoosePackageScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoosePackageCubit, ChoosePackageState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                      logo: false,
                      isNotificationScreen: false,
                      title: LocaleKeys.chooseTheRightPackage.tr(),
                    ),
                    SizedBox(height: 34.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                            ChoosePackageCubit.instance.pages.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              ChoosePackageCubit.instance
                                  .selectContainer(index);
                            },
                            child: CustomContainer(
                              title: ChoosePackageCubit.instance.words[index],
                              colorContainer:
                                  ChoosePackageCubit.instance.currentIndex ==
                                          index
                                      ? Color(0xff188DFF)
                                      : Color(0xffF7F5F9),
                              colorText:
                                  ChoosePackageCubit.instance.currentIndex ==
                                          index
                                      ? Color(0xffFFFFFF)
                                      : Color(0xff000000),
                            ),
                          );
                        }),
                      ],
                    ),
                   
                    if (ChoosePackageCubit.instance.currentIndex == 0)
                      ChoosePackageCubit.instance
                          .pages[ChoosePackageCubit.instance.currentIndex],
                    if (ChoosePackageCubit.instance.currentIndex == 1)
                      ChoosePackageCubit.instance
                          .pages[ChoosePackageCubit.instance.currentIndex],
                    if (ChoosePackageCubit.instance.currentIndex == 2)
                      ChoosePackageCubit.instance
                          .pages[ChoosePackageCubit.instance.currentIndex],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.title,
    required this.colorContainer,
    required this.colorText,
  });
  final String title;
  final Color colorContainer;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107.w,
      height: 35.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: colorContainer, borderRadius: BorderRadius.circular(19.r)),
      child: TextWidget(
        title,
        textStyle: AppTextStyle.textStyle(
            appFontSize: 13.sp,
            appFontHeight: 24.36.sp,
            appFontWeight: FontWeight.w700,
            color: colorText),
      ),
    );
  }
}

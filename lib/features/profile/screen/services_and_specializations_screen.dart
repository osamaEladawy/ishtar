import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/primary_button.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:ishtar/features/profile/cubit/profile_cubit.dart';
import 'package:ishtar/features/profile/widget/custom_radio.dart';
import 'package:ishtar/features/profile/widget/specializations.dart';
import 'package:ishtar/features/services/screen/services_screen.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class ServicesAndSpecializationsScreen extends StatelessWidget {
  const ServicesAndSpecializationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBarAuth(isText: true),
                    SizedBox(height: 26.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      alignment: Alignment.centerRight,
                      child: TextWidget(
                        LocaleKeys.services.tr(),
                        textStyle: AppTextStyle.textStyle(
                          roboto: true,
                          appFontSize: 16.sp,
                          appFontHeight: 18.sp,
                          appFontWeight: FontWeight.w900,
                          color: Color(0xff555555),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(ProfileCubit.instance.pages.length,
                              (index) {
                            return GestureDetector(
                              onTap: () {
                                ProfileCubit.instance.selectServices(index);
                              },
                              child: SelectServicesWidget(
                                title: ProfileCubit.instance.info[index]
                                    ['title'],
                                image: ProfileCubit.instance.info[index]
                                    ['icon'],
                                cover: ProfileCubit.instance.info[index]
                                    ['cover'],
                                colorContainer:
                                    ProfileCubit.instance.currentIndex ==
                                                index &&
                                            index == 0
                                        ? Color(0xff188DFF)
                                        : ProfileCubit.instance.currentIndex ==
                                                    index &&
                                                index == 1
                                            ? Color(0xff051336)
                                            : Color(0xffCCCFD6),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),
                    if (ProfileCubit.instance.currentIndex == 0)
                      ProfileCubit
                          .instance.pages[ProfileCubit.instance.currentIndex],
                    if (ProfileCubit.instance.currentIndex == 1)
                      ProfileCubit
                          .instance.pages[ProfileCubit.instance.currentIndex],
                    if (ProfileCubit.instance.currentIndex == 1)
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: Divider(
                          height: 1.h,
                          color: Color(0xffB1B1B1),
                        ),
                      ),
                    if (ProfileCubit.instance.currentIndex == 1)
                      SizedBox(height: 11.h),
                    if (ProfileCubit.instance.currentIndex == 1)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        alignment: Alignment.center,
                        child: TextWidget(
                          LocaleKeys.specialties.tr(),
                          textStyle: AppTextStyle.textStyle(
                            roboto: true,
                            appFontSize: 16.sp,
                            appFontHeight: 18.sp,
                            appFontWeight: FontWeight.w900,
                            color: Color(0xff555555),
                          ),
                        ),
                      ),
                    if (ProfileCubit.instance.currentIndex == 1)
                      SizedBox(height: 14.h),
                    if (ProfileCubit.instance.currentIndex == 1)
                      SpecializationsWidget(),
                    if (ProfileCubit.instance.currentIndex == 1)
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: Divider(height: 1.h, color: Color(0xffB1B1B1)),
                      ),
                    if (ProfileCubit.instance.currentIndex == 1)
                      SizedBox(height: 22.h),
                    if (ProfileCubit.instance.currentIndex == 1)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        alignment: Alignment.center,
                        child: TextWidget(
                          LocaleKeys.typeOfServices.tr(),
                          textStyle: AppTextStyle.textStyle(
                            roboto: true,
                            appFontSize: 16.sp,
                            appFontHeight: 18.sp,
                            appFontWeight: FontWeight.w900,
                            color: Color(0xff555555),
                          ),
                        ),
                      ),
                    if (ProfileCubit.instance.currentIndex == 1)
                      SizedBox(height: 23.h),
                    if (ProfileCubit.instance.currentIndex == 1)
                      CustomRadio(
                        value: 1,
                        groupValue: ProfileCubit.instance.isSelectRadio,
                        title: LocaleKeys.latestServices.tr(),
                        valueChanged: (value) {
                          ProfileCubit.instance.selectRadio(value);
                        },
                      ),
                    if (ProfileCubit.instance.currentIndex == 1)
                      CustomRadio(
                        value: 2,
                        groupValue: ProfileCubit.instance.isSelectRadio,
                        title: LocaleKeys.mostFollowed.tr(),
                        valueChanged: (value) {
                          ProfileCubit.instance.selectRadio(value);
                        },
                      ),
                    if (ProfileCubit.instance.currentIndex == 1)
                      CustomRadio(
                        value: 3,
                        groupValue: ProfileCubit.instance.isSelectRadio,
                        title: LocaleKeys.all.tr(),
                        valueChanged: (value) {
                          ProfileCubit.instance.selectRadio(value);
                        },
                      ),
                    if (ProfileCubit.instance.currentIndex == 1)
                      SizedBox(height: 22.31.h),
                    if (ProfileCubit.instance.currentIndex == 1)
                      Container(
                        margin: EdgeInsets.only(bottom: 40.h),
                        child: PrimaryButton(
                          title: LocaleKeys.continuee.tr(),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

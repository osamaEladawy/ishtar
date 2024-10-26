import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/profile/cubit/profile_cubit.dart';
import 'package:ishtar/features/profile/widget/about_doctor.dart';
import 'package:ishtar/features/profile/widget/custom_info_doc.dart';
import 'package:ishtar/features/profile/widget/photos.dart';
import 'package:ishtar/features/profile/widget/vedios.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: SvgPicture.asset(
          IconsManger.iconLogo,
          height: 30.51.h,
          width: 102.w,
          color: Color(0xff051336),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: SvgPicture.asset(
              IconsManger.arrow,
              height: 21.6.h,
              width: 12.69.w,
              color: Color(0xff555555),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 32.49.h),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Image.asset(ImageManger.profile_doc),
                        Positioned(
                          bottom: 2.h,
                          right: 2.w,
                          child: SvgPicture.asset(
                            IconsManger.plus,
                            height: 22.h,
                            width: 22.w,
                          ),
                        ),
                        Positioned(
                          bottom: -50.h,
                          child: TextWidget(
                            "Dr.Adamson",
                            textAlign: TextAlign.center,
                            textStyle: AppTextStyle.textStyle(
                              inter: true,
                              appFontSize: 20.sp,
                              appFontHeight: 44.sp,
                              appFontWeight: FontWeight.w400,
                              color: const Color(0xff000000),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 60.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomInfoDoc(
                        title: LocaleKeys.numberOfLikes.tr(),
                        image: IconsManger.like,
                      ),
                      CustomInfoDoc(
                        title: LocaleKeys.experience.tr(),
                        image: IconsManger.standr,
                      ),
                      CustomInfoDoc(
                        title: LocaleKeys.numberOfFollowers.tr(),
                        image: IconsManger.friends,
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(IconsManger.whatsapp),
                      SvgPicture.asset(IconsManger.inista),
                      SvgPicture.asset(IconsManger.facebook_icon),
                    ],
                  ),
                  SizedBox(height: 17.5.h),
                  Divider(
                    height: 1.h,
                    color: Color(0xffDADADA),
                  ),
                  SizedBox(height: 13.5.h),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(
                                ProfileCubit.instance.infoDoc.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  ProfileCubit.instance.selectMyText(index);
                                },
                                child: TextWidget(
                                  ProfileCubit.instance.infoDoc[index],
                                  textAlign: TextAlign.center,
                                  textStyle: AppTextStyle.textStyle(
                                    appFontSize: 14.sp,
                                    appFontHeight: 26.24.sp,
                                    appFontWeight: FontWeight.w700,
                                    color: ProfileCubit.instance.selectText ==
                                            index
                                        ? const Color(0xff188DFF)
                                        : const Color(0xff000000),
                                  ),
                                ),
                              );
                            })
                          ],
                        );
                      },
                    ),
                  ),
                  if (ProfileCubit.instance.selectText == 0) AboutDoctor(),
                  if (ProfileCubit.instance.selectText == 1) PhotosWidget(),
                  if (ProfileCubit.instance.selectText == 2) VideosWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

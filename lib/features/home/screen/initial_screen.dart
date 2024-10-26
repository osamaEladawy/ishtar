import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/home/cubit/home_cubit.dart';
import 'package:ishtar/features/home_tap/widget/custom_container_home.dart';
import 'package:ishtar/features/home_tap/widget/custom_icons.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0.h,
            right: 0.w,
            left: 0.w,
            child: Image.asset(ImageManger.bg),
          ),
          Positioned(
            top: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: CustomTextField(
                    hintText: LocaleKeys.findFriends.tr(),
                    isHome: true,
                    prefixIcon: Icons.search,
                  ),
                ),
                SizedBox(width: 9.w),
                SvgPicture.asset(IconsManger.logo),
              ],
            ),
          ),
          Positioned(
            top: 100.h,
            child: Row(
              children: [
                CustomContainerHome(
                  isChoosePlace: true,
                  title: LocaleKeys.chooseThePlace.tr(),
                ),
                SizedBox(width: 32.w),
                CustomContainerHome(
                  title: LocaleKeys.services.tr(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 31,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  //alignment: Alignment.center,
                  children: [
                    Image.asset(ImageManger.profileHome),
                    Positioned(
                      bottom: -5,
                      right: 0,
                      child: Container(
                        height: 26.h,
                        width: 26.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        child: SvgPicture.asset(IconsManger.lineV),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                CustomRightIcons(
                  image: IconsManger.like,
                  title: LocaleKeys.like.tr(),
                ),
                SizedBox(height: 10.h),
                CustomRightIcons(
                  image: IconsManger.favMsg,
                  title: LocaleKeys.favorites.tr(),
                ),
                SizedBox(height: 10.h),
                CustomRightIcons(
                  image: IconsManger.save,
                  title: LocaleKeys.save.tr(),
                ),
                SizedBox(height: 10.h),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return CustomRightIcons(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        HomeCubit.instance.comments.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 80.h,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Color(0xffC3CBD3),
                                              width: 0.5.w,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(HomeCubit.instance
                                                .comments[index].image),
                                            SizedBox(width: 10.w),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  HomeCubit.instance
                                                      .comments[index].userName,
                                                  textStyle:
                                                      AppTextStyle.textStyle(
                                                    appFontSize: 13.sp,
                                                    appFontWeight:
                                                        FontWeight.w700,
                                                    appFontHeight: 24.36.sp,
                                                    color: Color(0xff7B7B7B),
                                                  ),
                                                ),
                                                TextWidget(
                                                  HomeCubit.instance
                                                      .comments[index].comment,
                                                  textStyle:
                                                      AppTextStyle.textStyle(
                                                    appFontSize: 13.sp,
                                                    appFontWeight:
                                                        FontWeight.w600,
                                                    appFontHeight: 24.36.sp,
                                                    color: Color(0xff7B7B7B),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                IconsManger.deletes,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              );
                            });
                      },
                      image: IconsManger.comment,
                      title: LocaleKeys.comments.tr(),
                    );
                  },
                ),
                SizedBox(height: 10.h),
                CustomRightIcons(
                  image: IconsManger.share,
                  title: LocaleKeys.share.tr(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 31,
            left: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: TextWidget(
                    "Name here",
                    textStyle: AppTextStyle.textStyle(
                      inter: true,
                      appFontSize: 16.sp,
                      appFontWeight: FontWeight.w700,
                      appFontHeight: 19.36.sp,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  child: TextWidget(
                    "title of The video",
                    textStyle: AppTextStyle.textStyle(
                      inter: true,
                      appFontSize: 13.sp,
                      appFontWeight: FontWeight.w400,
                      appFontHeight: 15.73.sp,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Container(
                  child: TextWidget(
                    "here's a daily.. more",
                    textStyle: AppTextStyle.textStyle(
                      inter: true,
                      appFontSize: 13.sp,
                      appFontWeight: FontWeight.w400,
                      appFontHeight: 15.73.sp,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

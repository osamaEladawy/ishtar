import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/cutom_real_appBar.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/home/cubit/home_cubit.dart';
import 'package:ishtar/features/home/screen/details_screen.dart';
import 'package:ishtar/features/home/widgets/custom_text.dart';
import 'package:ishtar/features/services/screen/services_screen.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 100.w,
        leading: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: SvgPicture.asset(IconsManger.iconLogo)),
        title: CustomRealAppBar(),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Badge(
              alignment: Alignment.topRight,
              textColor: Color(0xffF51A1A),
              smallSize: 10,
              child: SvgPicture.asset(IconsManger.notify),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 17.h),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20.w),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  children: [
                    CustomTextFormField(
                      hintText: LocaleKeys.searchWithIshtar.tr(),
                    ),
                    SizedBox(width: 7.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.mapScreen);
                      },
                      child: Container(
                        height: 44.h,
                        width: 44.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          image: DecorationImage(
                            image: AssetImage(ImageManger.border_white),
                          ),
                        ),
                        child: SvgPicture.asset(
                          IconsManger.maps,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 15.w,
                  bottom: -14.h,
                  child: SvgPicture.asset(IconsManger.searchIcon),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            height: 168.h,
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.asset(
                    ImageManger.place,
                    height: 168.h,
                    //width: 355.w,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 10.w),
            ),
          ),
          SizedBox(height: 19.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.servicesScreen);
                  },
                  child: SelectServicesWidget(
                    title: LocaleKeys.touristServices.tr(),
                    image: ImageManger.businessWork,
                    cover: ImageManger.rectangle1,
                    colorContainer: Color(0xff188DFF),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.servicesScreen);
                  },
                  child: SelectServicesWidget(
                    title: LocaleKeys.medicalServices.tr(),
                    image: ImageManger.beatHeart,
                    cover: ImageManger.rectangle2,
                    colorContainer: Color(0xff051336),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 33.h),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  LocaleKeys.theTouristServices.tr(),
                  textStyle: AppTextStyle.textStyle(
                    appFontSize: 14.sp,
                    appFontHeight: 26.24.sp,
                    appFontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: TextWidget(
                    LocaleKeys.more.tr(),
                    textStyle: AppTextStyle.textStyle(
                      appFontSize: 13.sp,
                      appFontHeight: 24.36.sp,
                      appFontWeight: FontWeight.w500,
                      color: Color(0xff188DFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 33.h),
          Padding(
            padding:  EdgeInsets.only(right: 20.w),
            child: SizedBox(
              height: 235.h,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: HomeCubit.instance.touristServices.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 160.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black.withOpacity(.2)
                            )
                          ),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(top:13.h,bottom: 4,right: 8.w,left: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 98.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  image: DecorationImage(
                                      image: AssetImage(HomeCubit.instance.touristServices[index].image),
                                       fit: BoxFit.cover
                                  )
                                ),
                              ),
                              //Image.asset(HomeCubit.instance.touristServices[index].image,fit: BoxFit.fitWidth,),
                              SizedBox(height: 7.5.h),
                              TextWidget(
                                HomeCubit.instance.touristServices[index].name,
                                textStyle: AppTextStyle.textStyle(
                                  appFontSize: 13.sp,
                                  appFontHeight: 24.36.sp,
                                  appFontWeight: FontWeight.w600,
                                  color: Color(0xff111111),
                                ),
                              ),
                              TextWidget(
                                HomeCubit
                                    .instance.touristServices[index].category,
                                textStyle: AppTextStyle.textStyle(
                                  appFontSize: 12.sp,
                                  appFontHeight: 22.49.sp,
                                  appFontWeight: FontWeight.w500,
                                  color: Color(0xff66666E),
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    IconsManger.routing,
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                  SizedBox(width: 5.17.w),
                                  TextWidget(
                                    LocaleKeys.address.tr(),
                                    textAlign: TextAlign.right,
                                    textStyle: AppTextStyle.textStyle(
                                      appFontSize: 12.sp,
                                      appFontWeight: FontWeight.w500,
                                      appFontHeight: 22.49.sp,
                                      color: Color(0xff66666E),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: HomeCubit.instance
                                        .touristServices[index].isFavorite
                                        ? SvgPicture.asset(IconsManger.hearts)
                                        : SvgPicture.asset(IconsManger.heart),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 8.2.w),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 27.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  LocaleKeys.theMedicalServices.tr(),
                  textStyle: AppTextStyle.textStyle(
                    appFontSize: 14.sp,
                    appFontHeight: 26.24.sp,
                    appFontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: TextWidget(
                    LocaleKeys.more.tr(),
                    textStyle: AppTextStyle.textStyle(
                      appFontSize: 13.sp,
                      appFontHeight: 24.36.sp,
                      appFontWeight: FontWeight.w500,
                      color: Color(0xff188DFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 33.h),
          Padding(
            padding:  EdgeInsets.only(right: 20.w),
            child: SizedBox(
              height: 235.h,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: HomeCubit.instance.medicalServices.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 160.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black.withOpacity(.2)
                              )
                          ),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(top:13.h,bottom: 4,right: 8.w,left: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 98.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    image: DecorationImage(
                                        image: AssetImage(HomeCubit.instance.medicalServices[index].image),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              //Image.asset(HomeCubit.instance.touristServices[index].image,fit: BoxFit.fitWidth,),
                              SizedBox(height: 7.5.h),
                              TextWidget(
                                HomeCubit.instance.medicalServices[index].name,
                                textStyle: AppTextStyle.textStyle(
                                  appFontSize: 13.sp,
                                  appFontHeight: 24.36.sp,
                                  appFontWeight: FontWeight.w600,
                                  color: Color(0xff111111),
                                ),
                              ),
                              TextWidget(
                                HomeCubit
                                    .instance.medicalServices[index].category,
                                textStyle: AppTextStyle.textStyle(
                                  appFontSize: 12.sp,
                                  appFontHeight: 22.49.sp,
                                  appFontWeight: FontWeight.w500,
                                  color: Color(0xff66666E),
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    IconsManger.routing,
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                  SizedBox(width: 5.17.w),
                                  TextWidget(
                                    LocaleKeys.address.tr(),
                                    textAlign: TextAlign.right,
                                    textStyle: AppTextStyle.textStyle(
                                      appFontSize: 12.sp,
                                      appFontWeight: FontWeight.w500,
                                      appFontHeight: 22.49.sp,
                                      color: Color(0xff66666E),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: HomeCubit.instance
                                        .medicalServices[index].isFavorite
                                        ? SvgPicture.asset(IconsManger.hearts)
                                        : SvgPicture.asset(IconsManger.heart),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 8.2.w),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 27.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextWidget(
                LocaleKeys.suggestedServices.tr(),
                textStyle: AppTextStyle.textStyle(
                  appFontSize: 14.sp,
                  appFontHeight: 26.24.sp,
                  appFontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
          SizedBox(height: 33.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.detailsScreen,
                      arguments: HomeCubit.instance.optionServices[index],
                    );
                  },
                  child: Container(
                    height: 98.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffC3CBD3),
                          width: 0.5.w,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                             // height: 84.h,
                              width: 101.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(HomeCubit.instance.optionServices[index].image))
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  HomeCubit
                                      .instance.optionServices[index].name,
                                  textStyle: AppTextStyle.textStyle(
                                    appFontSize: 13.sp,
                                    appFontHeight: 24.36.sp,
                                    appFontWeight: FontWeight.w600,
                                    color: Color(0xff111111),
                                  ),
                                ),
                                TextWidget(
                                  HomeCubit.instance.optionServices[index]
                                      .category,
                                  textStyle: AppTextStyle.textStyle(
                                    appFontSize: 12.sp,
                                    appFontHeight: 22.49.sp,
                                    appFontWeight: FontWeight.w500,
                                    color: Color(0xff66666E),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                      IconsManger.routing,
                                      height: 24.h,
                                      width: 24.w,
                                    ),
                                    SizedBox(width: 5.17.w),
                                    TextWidget(
                                      LocaleKeys.address.tr(),
                                      textAlign: TextAlign.right,
                                      textStyle: AppTextStyle.textStyle(
                                        appFontSize: 12.sp,
                                        appFontWeight: FontWeight.w500,
                                        appFontHeight: 22.49.sp,
                                        color: Color(0xff66666E),
                                      ),
                                    ),
                                    //Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: HomeCubit
                                  .instance.optionServices[index].isFavorite
                              ? SvgPicture.asset(IconsManger.hearts)
                              : SvgPicture.asset(IconsManger.heart),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 13.h),
              itemCount: HomeCubit.instance.optionServices.length,
            ),
          ),
        ],
      ),
    );
  }
}

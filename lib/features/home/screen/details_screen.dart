import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/cutom_real_appBar.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/home/cubit/home_cubit.dart';
import 'package:ishtar/features/home/models/hostpital_model.dart';
import 'package:ishtar/features/home/widgets/custom_container_button.dart';
import 'package:ishtar/translations/locale_keys.g.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.myModel});
  final MyModel myModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 100.w,
        leading: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: SvgPicture.asset(IconsManger.logo)),
        title: CustomRealAppBar(),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: SvgPicture.asset(IconsManger.notify),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 17.h),
                  SizedBox(
                    height: 296.h,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: HomeCubit.instance.controller,
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              //width: 350.w,
                              child: Image.asset(ImageManger.hospital_large),
                            ),
                            Positioned(
                              bottom: 10.h,
                              child: SmoothPageIndicator(
                                controller: HomeCubit
                                    .instance.controller, // PageController
                                count: 6,
                                axisDirection: Axis.horizontal,
                                effect: WormEffect(
                                  dotHeight: 10.h,
                                  dotWidth: 10.w,
                                  activeDotColor: Color(0xff051336),
                                  dotColor: Color(0xffF7F5F9),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(IconsManger.hearts),
                      SizedBox(width: 10.w),
                      SvgPicture.asset(IconsManger.share_icon),
                      SizedBox(width: 20.w),
                    ],
                  ),
                  SizedBox(height: 11.5.h),
                  Row(
                    children: [
                      TextWidget(
                        LocaleKeys.hospitalName.tr(),
                        textStyle: AppTextStyle.textStyle(
                          appFontSize: 18.sp,
                          appFontWeight: FontWeight.w700,
                          appFontHeight: 33.73.sp,
                          color: Color(0xff000000),
                        ),
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            IconsManger.like,
                            height: 24.h,
                            color: Color(0xff188DFF),
                          ),
                          SizedBox(width: 6.w),
                          TextWidget(
                            LocaleKeys.numberOfLikes.tr(),
                            textAlign: TextAlign.end,
                            textStyle: AppTextStyle.textStyle(
                              appFontSize: 14.sp,
                              appFontWeight: FontWeight.w500,
                              appFontHeight: 26.24.sp,
                              color: Color(0xff66666E),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      TextWidget(
                        "${LocaleKeys.category.tr()}: ${LocaleKeys.medicalServices.tr()}",
                        textStyle: AppTextStyle.textStyle(
                          appFontSize: 14.sp,
                          appFontWeight: FontWeight.w500,
                          appFontHeight: 26.24.sp,
                          color: Color(0xff66666E),
                        ),
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            IconsManger.friends,
                            height: 19.h,
                            color: Color(0xff188DFF),
                          ),
                          SizedBox(width: 6.w),
                          TextWidget(
                            LocaleKeys.numberOfFollowers.tr(),
                            textAlign: TextAlign.end,
                            textStyle: AppTextStyle.textStyle(
                              appFontSize: 14.sp,
                              appFontWeight: FontWeight.w500,
                              appFontHeight: 26.24.sp,
                              color: Color(0xff66666E),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 26.h),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(2, (index) {
                            return GestureDetector(
                              onTap: () {
                                HomeCubit.instance.selectOptions(index);
                              },
                              child: CustomContainerButton(
                                title: HomeCubit.instance.titles[index]
                                    ['title'],
                                image: HomeCubit.instance.titles[index]
                                    ['image'],
                                color:
                                    HomeCubit.instance.selectedOption == index
                                        ? Theme.of(context).primaryColor
                                        : Color(0xffF7F5F9),
                                textColor:
                                    HomeCubit.instance.selectedOption == index
                                        ? Color(0xffFFFFFF)
                                        : Color(0xff051336),
                              ),
                            );
                          }),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 35.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextWidget(
                     LocaleKeys.information.tr(),
                      textStyle: AppTextStyle.textStyle(
                        appFontSize: 15.sp,
                        appFontHeight: 28.11.sp,
                        appFontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0.w),
                    child: TextWidget(
                      """هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عـن التركـيز عـلى الشكـل الخارجـي للنــص أو شكــل توضـع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ""",
                      textStyle: AppTextStyle.textStyle(
                        appFontSize: 12.sp,
                        appFontHeight: 22.49.sp,
                        appFontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                           LocaleKeys.hospitalGeographicLocations.tr(),
                            textStyle: AppTextStyle.textStyle(
                              appFontSize: 15.sp,
                              appFontHeight: 28.11.sp,
                              appFontWeight: FontWeight.w700,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(height: 17.h),
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: TextWidget(
                              "الحى السابع، مدينة نصر، القاهره، مصر",
                              textStyle: AppTextStyle.textStyle(
                                appFontSize: 12.sp,
                                appFontHeight: 22.49.sp,
                                appFontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          TextWidget(
                            LocaleKeys.contactUsThrough.tr(),
                            textStyle: AppTextStyle.textStyle(
                              appFontSize: 15.sp,
                              appFontHeight: 28.11.sp,
                              appFontWeight: FontWeight.w700,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(ImageManger.maps),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(ImageManger.face),
                      Image.asset(ImageManger.messenger),
                      Image.asset(ImageManger.inistaaaaa),
                      Image.asset(ImageManger.whats),
                      Image.asset(ImageManger.twitter),
                      Image.asset(ImageManger.telegram),
                    ],
                  ),
                  SizedBox(height: 30.5.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextWidget(
                      LocaleKeys.adOwner.tr(),
                      textStyle: AppTextStyle.textStyle(
                        appFontSize: 15.sp,
                        appFontHeight: 28.11.sp,
                        appFontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  SizedBox(height: 13.5.h),
                  Container(
                    height: 78.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Image.asset(
                          ImageManger.profileHome,
                          height: 62.h,
                          width: 62.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              "name",
                              textStyle: AppTextStyle.textStyle(
                                appFontSize: 18.sp,
                                appFontHeight: 33.73.sp,
                                appFontWeight: FontWeight.w700,
                                color: Color(0xff111111),
                              ),
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: LocaleKeys.memberSince.tr(),
                                style: AppTextStyle.textStyle(
                                  appFontSize: 13.sp,
                                  appFontHeight: 24.36.sp,
                                  appFontWeight: FontWeight.w600,
                                  color: Color(0xff111111),
                                ),
                              ),
                              TextSpan(
                                text: " 2020",
                                style: AppTextStyle.textStyle(
                                  appFontSize: 13.sp,
                                  appFontHeight: 24.36.sp,
                                  appFontWeight: FontWeight.w600,
                                  color: Color(0xff111111),
                                ),
                              ),
                            ])),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(IconsManger.arrow_left)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

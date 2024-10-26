import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/home/cubit/home_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: TextWidget(
          LocaleKeys.category.tr(),
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
            child: SvgPicture.asset(IconsManger.notify),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 17.82.h),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(HomeCubit.instance.categories.length,
                        (index) {
                      return GestureDetector(
                        onTap: () {
                          HomeCubit.instance.selectCategory(index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: TypeCategory(
                            title: HomeCubit.instance.categories[index]
                                ['title'],
                            colorContainer:
                                HomeCubit.instance.selectedCategory == index
                                    ? Color(0xff188DFF)
                                    : Color(0xffF0F0F0),
                            image: HomeCubit.instance.categories[index]
                                ['image'],
                            colorText:
                                HomeCubit.instance.selectedCategory == index
                                    ? Color(0xffFFFFFF)
                                    : Color(0xff7B7B7B),
                          ),
                        ),
                      );
                    })
                  ],
                );
              },
            ),
            SizedBox(height: 18.h),
            Expanded(
              child: ListView.separated(
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
                              Image.asset(
                                HomeCubit.instance.optionServices[index].image,
                                height: 84.h,
                                width: 101.w,
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
      ),
    );
  }
}

class TypeCategory extends StatelessWidget {
  const TypeCategory({
    super.key,
    required this.title,
    required this.image,
    required this.colorContainer,
    required this.colorText,
  });
  final String title;
  final String image;
  final Color colorContainer;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 127.w,
      padding: EdgeInsets.all(7),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: colorContainer,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            color: colorText,
          ),
          SizedBox(width: 5.w),
          TextWidget(
            title,
            textStyle: AppTextStyle.textStyle(
              appFontSize: 14.sp,
              appFontHeight: 26.24.sp,
              appFontWeight: FontWeight.w700,
              color: colorText,
            ),
          ),
        ],
      ),
    );
  }
}

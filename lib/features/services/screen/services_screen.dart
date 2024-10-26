import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/services/cubit/services_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: TextWidget(
          LocaleKeys.services.tr(),
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
      body: SafeArea(
        child: BlocConsumer<ServicesCubit, ServicesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(right: 20.w, left: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 21.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(ServicesCubit.instance.pages.length,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            ServicesCubit.instance.selectServices(index);
                          },
                          child: SelectServicesWidget(
                            title: ServicesCubit.instance.info[index]['title'],
                            image: ServicesCubit.instance.info[index]['icon'],
                            cover: ServicesCubit.instance.info[index]['cover'],
                            colorContainer:
                                ServicesCubit.instance.currentIndex == index &&
                                        index == 0
                                    ? Color(0xff188DFF)
                                    : ServicesCubit.instance.currentIndex ==
                                                index &&
                                            index == 1
                                        ? Color(0xff051336)
                                        : Color(0xffCCCFD6),
                          ),
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  if (ServicesCubit.instance.currentIndex == 0)
                    ServicesCubit
                        .instance.pages[ServicesCubit.instance.currentIndex],
                  if (ServicesCubit.instance.currentIndex == 1)
                    ServicesCubit
                        .instance.pages[ServicesCubit.instance.currentIndex]
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SelectServicesWidget extends StatelessWidget {
  const SelectServicesWidget({
    super.key,
    required this.colorContainer,
    // required this.colorText,
    required this.title,
    required this.image,
    required this.cover,
  });
  final Color colorContainer;
  // final Color colorText;
  final String title;
  final String image;
  final String cover;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 170.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color:
            // Color(0xffCCCFD6)
            colorContainer,
      ),
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 56.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              image: DecorationImage(
                image: AssetImage(cover),
              ),
            ),
            child: Image.asset(image),
          ),
          TextWidget(
            title,
            textStyle: AppTextStyle.textStyle(
              appFontSize: 13.sp,
              appFontHeight: 24.36.sp,
              appFontWeight: FontWeight.w700,
              color: Color(0xffF7F5F9),
            ),
          ),
        ],
      ),
    );
  }
}

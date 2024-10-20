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
          "الحدمات",
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
                          child: SelectServices(
                            title: 'Hello',
                            image: ImageManger.travelLuggage,
                          ),
                        );
                      }),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SelectServices extends StatelessWidget {
  const SelectServices({
    super.key,
    // required this.colorContainer,
    // required this.colorText,
    required this.title,
    required this.image,
  });
  //final Color colorContainer;
  //final Color colorText;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 170.w,
      decoration: BoxDecoration(color: Color(0xffCCCFD6)
          //colorContainer,
          ),
      child: Row(
        children: [
          Image.asset(image),
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

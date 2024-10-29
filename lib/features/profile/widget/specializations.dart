import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/features/profile/cubit/profile_cubit.dart';

class SpecializationsWidget extends StatelessWidget {
  const SpecializationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ProfileCubit.instance.specializations.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 13.h,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, Routes.homeTapScreen);
              },
              child: SizedBox(
                height: 110.h,
                width: 110.w,
                child: Card(
                  color: Color(0xffF7F5F9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          ProfileCubit.instance.specializations[index].image),
                      SizedBox(height: 11.h),
                      TextWidget(
                        ProfileCubit
                            .instance.specializations[index].categoryName,
                        textStyle: AppTextStyle.textStyle(
                          appFontSize: 13.sp,
                          appFontWeight: FontWeight.w700,
                          appFontHeight: 24.36.sp,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

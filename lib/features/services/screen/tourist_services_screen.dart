import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/features/services/cubit/services_cubit.dart';

class TouristServicesScreen extends StatelessWidget {
  const TouristServicesScreen({
    super.key,
    this.isServicesAndSpecializations = false,
  });
  final bool isServicesAndSpecializations;

  @override
  Widget build(BuildContext context) {
    return isServicesAndSpecializations
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            height: MediaQuery.of(context).size.height * 0.30,
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ServicesCubit.instance.categories1.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 13.h,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: SizedBox(
                      height: 110.h,
                      width: 110.w,
                      child: Card(
                        color: Color(0xffF7F5F9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ServicesCubit
                                .instance.categories1[index].image),
                            SizedBox(height: 11.h),
                            TextWidget(
                              ServicesCubit
                                  .instance.categories1[index].categoryName,
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
          )
        : Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: ServicesCubit.instance.categories1.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 13.h,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: SizedBox(
                      height: 110.h,
                      width: 110.w,
                      child: Card(
                        color: Color(0xffF7F5F9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ServicesCubit
                                .instance.categories1[index].image),
                            SizedBox(height: 11.h),
                            TextWidget(
                              ServicesCubit
                                  .instance.categories1[index].categoryName,
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

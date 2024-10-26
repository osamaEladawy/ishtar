import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:ishtar/features/my_ads/cubit/my_ads_cubit.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MyAdsCubit, MyAdsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                CustomAppBarAuth(
                  isText: true,
                  isAds: true,
                ),
                SizedBox(height: 27.h),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: MyAdsCubit.instance.ads.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.chooseProvinceScreen,
                          );
                        },
                        child: Container(
                          height: 112.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xffC3CBD3),
                                width: 0.5.w,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff00000029).withOpacity(0.2),
                                blurRadius: 3,
                                spreadRadius: 1,
                                offset: Offset(3, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                MyAdsCubit.instance.ads[index],
                                height: 85.h,
                                width: 161.w,
                              ),
                              SizedBox(width: 5.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    "Cinema technique",
                                    textStyle: AppTextStyle.textStyle(
                                      inter: true,
                                      appFontSize: 11.sp,
                                      appFontHeight: 17.sp,
                                      appFontWeight: FontWeight.w400,
                                      color: Color(0xff17171A),
                                    ),
                                  ),
                                  TextWidget(
                                    "15 MINUTES AGO",
                                    textStyle: AppTextStyle.textStyle(
                                      inter: true,
                                      appFontSize: 8.sp,
                                      appFontHeight: 17.sp,
                                      appFontWeight: FontWeight.w400,
                                      color: Color(0xff17171A),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: 9.h,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/primary_button.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/choose_your_package/cubit/choose_package_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoosePackageCubit, ChoosePackageState>(
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              SizedBox(height: 15.h),
              Container(
                alignment: Alignment.topRight,
                child: TextWidget(
                  LocaleKeys.youCanAddOnlyThreePhotos.tr(),
                  textAlign: TextAlign.right,
                  textStyle: AppTextStyle.textStyle(
                    appFontSize: 13.sp,
                    appFontWeight: FontWeight.w700,
                    appFontHeight: 24.36.sp,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(ImageManger.upImage),
                            Positioned(
                              child: SvgPicture.asset(IconsManger.vector),
                            ),
                            Positioned(
                              bottom: 19,
                              right: 26,
                              child: GestureDetector(
                                  onTap: () {},
                                  child:
                                      SvgPicture.asset(IconsManger.iconPlus)),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 14.h),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.27,
                    child: PrimaryButton(
                      title: LocaleKeys.subscribeNow.tr(),
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.verificationCodeScreen);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

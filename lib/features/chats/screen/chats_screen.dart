import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/chats/cubit/chats_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 100.w,
        leading: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: SvgPicture.asset(IconsManger.iconLogo)),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              LocaleKeys.address.tr(),
              textAlign: TextAlign.center,
              textStyle: AppTextStyle.textStyle(
                appFontSize: 10.sp,
                appFontHeight: 18.74.sp,
                appFontWeight: FontWeight.w600,
                color: const Color(0xff66666E),
              ),
            ),
            TextWidget(
              LocaleKeys.location.tr(),
              textAlign: TextAlign.center,
              textStyle: AppTextStyle.textStyle(
                appFontSize: 10.sp,
                appFontHeight: 18.74.sp,
                appFontWeight: FontWeight.w700,
                color: const Color(0xff010101),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: SvgPicture.asset(IconsManger.notify),
          ),
        ],
      ),
      body: BlocBuilder<ChatsCubit, ChatsState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(right: 20.w, left: 20.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Container(
                  height: 50.h,
                  color: Color(0xffFFFFFF),
                  child: CustomTextField(
                    isChat: true,
                    hintText: LocaleKeys.whatAreYouLookingFor.tr(),
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: ListView.builder(
                      itemCount: ChatsCubit.instance.chats.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.chatInfoScreen,
                              arguments: ChatsCubit.instance.chats[index],
                            );
                          },
                          child: Container(
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
                                Image.asset(
                                  ChatsCubit.instance.chats[index].image,
                                  height: 50.h,
                                  width: 50.w,
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      ChatsCubit.instance.chats[index].name,
                                      textAlign: TextAlign.center,
                                      textStyle: AppTextStyle.textStyle(
                                        appFontSize: 13.sp,
                                        appFontHeight: 24.36.sp,
                                        appFontWeight: FontWeight.w600,
                                        color: const Color(0xff010101),
                                      ),
                                    ),
                                    TextWidget(
                                      ChatsCubit.instance.chats[index].message,
                                      textAlign: TextAlign.center,
                                      textStyle: AppTextStyle.textStyle(
                                        appFontSize: 11.sp,
                                        appFontHeight: 20.61.sp,
                                        appFontWeight: FontWeight.w400,
                                        color: const Color(0xff66666E),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                TextWidget(
                                  ChatsCubit.instance.chats[index].date,
                                  textAlign: TextAlign.center,
                                  textStyle: AppTextStyle.textStyle(
                                    appFontSize: 11.sp,
                                    appFontHeight: 20.61.sp,
                                    appFontWeight: FontWeight.w400,
                                    color: const Color(0xff66666E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

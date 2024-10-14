import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool? hasNotification;
  final bool isNotificationScreen;
  const CustomAppBar({
    super.key,
    this.title = "",
    this.hasNotification = true,
    this.isNotificationScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 30.w,
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                    color: Theme.of(context).disabledColor, width: 1)),
            child: SvgPicture.asset(
              IconsManger.arrowDownIcon,
            ),
          ),
        ),
        if (hasNotification == false) const Spacer(),
        if (title.isNotEmpty || title == "")
          TextWidget(
            title,
            textStyle: AppTextStyle.textStyle(
              appFontSize: 18.sp,
              appFontWeight: FontWeight.w700,
              color: const Color(0xff2D2D2D),
            ),
          ),
        hasNotification == true
            ? GestureDetector(
                onTap: () {
                  if (isNotificationScreen) {
                    return;
                  }
                  //Navigator.pushNamed(context, Routes.notificationScreen);
                },
                child: SvgPicture.asset(IconsManger.notificationIcon))
            : const SizedBox(),
      ],
    );
  }
}

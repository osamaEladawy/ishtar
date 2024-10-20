import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String icon;
  final String text;
  final bool? active;
  final int index;

  const CustomButtonAppBar({
    super.key,
    this.onPressed,
    required this.icon,
    required this.text,
    this.active,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            color: active == true
                ? Theme.of(navigatorKey.currentContext!).primaryColor
                : null,
          ),
          TextWidget(
            text,
            textStyle: AppTextStyle.textStyle(
              color: active == true
                  ? Theme.of(navigatorKey.currentContext!).primaryColor
                  : Color(0xff999999),
              appFontSize: 10.sp,
              appFontWeight: FontWeight.w500,
              appFontHeight: 17.74.sp,
            ),
          ),
        ],
      ),
    );
  }
}

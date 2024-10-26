import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/config/resources.dart';

class CustomAppBarAuth extends StatelessWidget {
  const CustomAppBarAuth({
    super.key,
    this.isNotAuth = false,
    this.isText = false,
    this.isAds = false,
  });
  final bool isNotAuth;
  final bool isText;
  final bool isAds;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 143.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Color(0xffF8F8F8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.r),
          bottomRight: Radius.circular(60.r),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff0000000F).withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isAds && isText ? SizedBox() : SvgPicture.asset(IconsManger.recicle),
          isNotAuth
              ? SvgPicture.asset(
                  IconsManger.logo_not_auth,
                  height: 98.h,
                  width: 95.w,
                )
              : isText
                  ? SvgPicture.asset(
                      IconsManger.iconLogo,
                      height: 28.42.h,
                      width: 95.w,
                      color: Color(0xff051336),
                    )
                  : Image.asset(
                      ImageManger.auth_logo,
                      height: 84.h,
                      width: 153.w,
                    ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              IconsManger.arrow,
              height: 21.6.h,
              width: 12.69.w,
              color: Color(0xff555555),
            ),
          )
        ],
      ),
    );
  }
}

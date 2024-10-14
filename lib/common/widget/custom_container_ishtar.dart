import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/config/resources.dart';

class CustomContainerIshtar extends StatelessWidget {
  const CustomContainerIshtar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 249.h,
      width: 242.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(47.r),
        gradient: const LinearGradient(
          colors: [
            Color(0xff27B9EC),
            Color(0xff1350A3),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // i want to create condition
          // if lang is ar
          ...picChars.reversed,
        ],
      ),
    );
  }
}

List<Widget> picChars = [
  Container(
    margin: EdgeInsets.only(right: 5.w),
    child: SvgPicture.asset(IconsManger.ii),
  ),
  Container(
    margin: EdgeInsets.only(right: 5.w),
    child: SvgPicture.asset(IconsManger.s),
  ),
  Container(
    margin: EdgeInsets.only(right: 5.w),
    child: SvgPicture.asset(IconsManger.h),
  ),
  Container(
    margin: EdgeInsets.only(right: 5.w),
    child: SvgPicture.asset(IconsManger.t),
  ),
  Container(
    margin: EdgeInsets.only(right: 5.w),
    child: SvgPicture.asset(IconsManger.a),
  ),
  SizedBox(width: 5.w),
  Stack(
    clipBehavior: Clip.none,
    children: [
      SvgPicture.asset(IconsManger.i),
      Positioned(
        top: -25,
        right: -30,
        child: SvgPicture.asset(
          IconsManger.correct,
        ),
      )
    ],
  ),
];

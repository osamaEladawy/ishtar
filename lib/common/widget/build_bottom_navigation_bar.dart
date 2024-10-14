import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildBottomNavigationBar extends StatelessWidget {
  const BuildBottomNavigationBar({Key? key,required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(35.r),
          topLeft: Radius.circular(35.r),
        ),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(.1),
              blurRadius: 10,
              offset: Offset(0, -4))
        ],
      ),
      child: child,
    );
  }
}

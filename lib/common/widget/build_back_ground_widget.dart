import 'package:flutter/material.dart';

import '../../config/resources.dart';

class BuildBackGroundWidget extends StatelessWidget {
  const BuildBackGroundWidget({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageManger.back_ground_img),
              fit: BoxFit.fitWidth)),
      child: child,
    );
  }
}

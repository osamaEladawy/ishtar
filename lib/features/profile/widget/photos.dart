import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/features/profile/cubit/profile_cubit.dart';

class PhotosWidget extends StatelessWidget {
  const PhotosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 26.h),
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ProfileCubit.instance.photos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 26.w,
                  mainAxisSpacing: 15.h),
              itemBuilder: (context, index) {
                return Container(
                  height: 116.h,
                  width: 100.w,
                  child: Image.asset(ProfileCubit.instance.photos[index]),
                );
              }),
        );
      },
    );
  }
}

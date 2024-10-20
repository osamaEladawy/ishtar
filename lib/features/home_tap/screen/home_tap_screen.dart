import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/home_tap/cubit/home_tap_cubit.dart';
import 'package:ishtar/features/home_tap/widget/custom_appBar.dart';

class HomeTapScreen extends StatelessWidget {
  const HomeTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTapCubit, HomeTapState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            height: 72.w,
            color: Colors.white,
            child: Container(
              alignment: Alignment.center,
              //width: 390.w,
              height: 72.4.h,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(HomeTapCubit.instance.pages.length + 1,
                          (index) {
                        int i = index > 2 ? index - 1 : index;
                        return index == 2
                            ? const Spacer()
                            : Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    HomeTapCubit.instance.changePage(i);
                                  },
                                  child: CustomButtonAppBar(
                                    index: i,
                                    active:
                                        HomeTapCubit.instance.currentIndex == i,
                                    onPressed: () {
                                      HomeTapCubit.instance.changePage(i);
                                    },
                                    icon: HomeTapCubit.instance.words[i]
                                        ['icon'],
                                    text: HomeTapCubit.instance.words[i]
                                        ['title'],
                                  ),
                                ),
                              );
                      }),
                    ],
                  ),
                  Positioned(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.choosePackage);
                      },
                      child: SvgPicture.asset(
                        IconsManger.button,
                        width: 50.w,
                        height: 45.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(25.r),
          //       topRight: Radius.circular(25.r),
          //     ),
          //   ),
          //   child: BottomNavigationBar(
          //     type: BottomNavigationBarType.fixed,
          //     backgroundColor: Theme.of(context).cardColor,
          //     // selectedItemColor: const Color(0xff273B4A),
          //     currentIndex: HomeTapCubit.instance.currentIndex,
          //     onTap: (index) {
          //       HomeTapCubit.instance.changePage(index);
          //
          //     },
          //     items: HomeTapCubit.instance.tabItems(),
          //   ),
          // ),
          body: HomeTapCubit.instance.pages
              .elementAt(HomeTapCubit.instance.currentIndex),
        );
      },
    );
  }
}

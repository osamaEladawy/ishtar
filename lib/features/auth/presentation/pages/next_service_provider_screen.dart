import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/primary_button.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/auth/cubit/auth_cubit.dart';
import 'package:ishtar/features/auth/presentation/pages/select_visitor_screen.dart';
import 'package:ishtar/features/auth/presentation/widgets/custom_ontainer_for_select_methods.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class NextServiceProviderScreen extends StatelessWidget {
  const NextServiceProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(AuthCubit.instance.pages.length,
                            (index) {
                          return GestureDetector(
                            onTap: () {
                              AuthCubit.instance.setSelectDoc(index);
                            },
                            child: CustomContainerForSelectMethods(
                              //isLogin: false,
                              isWidth: true,
                              color:
                                  AuthCubit.instance.selectDocOrVisible == index
                                      ? const Color(0xff188DFF)
                                      : const Color(0xffF7F5F9),
                              colorText:
                                  AuthCubit.instance.selectDocOrVisible == index
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff020202),
                              image: AuthCubit.instance.options2[index].image,
                              title: AuthCubit.instance.options2[index].title,
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: 41.h),
                    if (AuthCubit.instance.selectDocOrVisible == 0)
                      AuthCubit.instance
                          .pages[AuthCubit.instance.selectDocOrVisible],
                    if (AuthCubit.instance.selectDocOrVisible == 1)
                      AuthCubit.instance
                          .pages[AuthCubit.instance.selectDocOrVisible],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/primary_button.dart';
import 'package:ishtar/config/routes_manager.dart';
import 'package:ishtar/features/auth/cubit/auth_cubit.dart';
import 'package:ishtar/features/auth/presentation/widgets/custom_ontainer_for_select_methods.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class ChooseTypeServiceScreen extends StatelessWidget {
  const ChooseTypeServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
          child: Column(
            children: [
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(AuthCubit.instance.pages.length,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            AuthCubit.instance.setSelectDoc(index);
                            if (AuthCubit.instance.selectDocOrVisible == 1) {
                              Navigator.pushNamed(
                                  context, Routes.nextServiceProviderScreen);
                            }
                          },
                          child: SizedBox(
                            width: 170.w,
                            height: 38.h,
                            child: CustomContainerForSelectMethods(
                              isRegister: true,
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
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
              SizedBox(height: 41.h),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(AuthCubit.instance.options.length,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            AuthCubit.instance.setSelectHosDoc(index);
                          },
                          child: CustomContainerForSelectMethods(
                            isWidth: false,
                            isRegister: true,
                            title: AuthCubit.instance.options[index].title,
                            color: AuthCubit.instance.selectHosOrDoc == index
                                ? const Color(0xff188DFF)
                                : const Color(0xffF7F5F9),
                            colorText:
                                AuthCubit.instance.selectHosOrDoc == index
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff020202),
                            image: AuthCubit.instance.options[index].image,
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
              SizedBox(height: 41.h),
              CustomTextField(hintText: LocaleKeys.hospitalName.tr()),
              SizedBox(height: 17.h),
              CustomTextField(hintText: LocaleKeys.addressHospital.tr()),
              SizedBox(height: 17.h),
              CustomTextField(hintText: LocaleKeys.hospitalName.tr()),
              SizedBox(height: 17.h),
              CustomTextField(hintText: LocaleKeys.hospitalName.tr()),
              SizedBox(height: 97.h),
              PrimaryButton(
                title: LocaleKeys.continuee.tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.homeTapScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

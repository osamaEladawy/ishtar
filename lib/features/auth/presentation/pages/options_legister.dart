import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/primary_button.dart';
import 'package:ishtar/features/auth/cubit/auth_cubit.dart';
import 'package:ishtar/features/auth/presentation/widgets/doc_or_visitor.dart';

class OptionsLoginOrRegister extends StatelessWidget {
  const OptionsLoginOrRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          child: Column(
            children: [
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(AuthCubit.instance.titles.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            AuthCubit.instance.setSelectDoc(index);
                          },
                          child: DoctorOrVisitor(
                            isLogin: false,
                            isWidth: true,
                            title: AuthCubit.instance.titles[index],
                            color: AuthCubit.instance.selectDocOrVisible == index
                                ? const Color(0xff188DFF)
                                : const Color(0xffF7F5F9),
                            colorText: AuthCubit.instance.selectDocOrVisible == index
                                ? const Color(0xffFFFFFF)
                                : const Color(0xff020202),
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
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(AuthCubit.instance.titles2.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            AuthCubit.instance.setSelectHosDoc(index);
                          },
                          child: DoctorOrVisitor(
                            isLogin: false,
                            isWidth: false,
                            title: AuthCubit.instance.titles2[index],
                            color: AuthCubit.instance.selectHosOrDoc == index
                                ? const Color(0xff188DFF)
                                : const Color(0xffF7F5F9),
                            colorText: AuthCubit.instance.selectHosOrDoc == index
                                ? const Color(0xffFFFFFF)
                                : const Color(0xff020202),
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
              SizedBox(height: 41.h),
              const CustomTextField(hintText: "اسم المستشفي"),
              SizedBox(height: 17.h),
              const CustomTextField(hintText: "اسم المستشفي"),
              SizedBox(height: 17.h),
              const CustomTextField(hintText: "اسم المستشفي"),
              SizedBox(height: 17.h),
              const CustomTextField(hintText: "اسم المستشفي"),
              SizedBox(height: 97.h),
              PrimaryButton(
                title: "متابعه",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

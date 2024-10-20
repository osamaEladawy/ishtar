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

class SelectVisitorScreen extends StatelessWidget {
  const SelectVisitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(AuthCubit.instance.options.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        AuthCubit.instance.setSelectHosDoc(index);
                      },
                      child: CustomContainerForSelectMethods(
                        //isLogin: false,
                        isWidth: false,
                        title: AuthCubit.instance.options3[index].title,
                        color: AuthCubit.instance.selectHosOrDoc == index
                            ? const Color(0xff188DFF)
                            : const Color(0xffF7F5F9),
                        colorText: AuthCubit.instance.selectHosOrDoc == index
                            ? const Color(0xffFFFFFF)
                            : const Color(0xff020202),
                        image: AuthCubit.instance.options3[index].image,
                      ),
                    );
                  }),
                ],
              );
            },
          ),
          SizedBox(height: 41.h),
          CustomTextField(hintText: LocaleKeys.areaName.tr()),
          SizedBox(height: 17.h),
          CustomTextField(hintText: LocaleKeys.areaName.tr()),
          SizedBox(height: 17.h),
          CustomTextField(hintText: LocaleKeys.areaName.tr()),
          SizedBox(height: 17.h),
          CustomTextField(hintText: LocaleKeys.areaName.tr()),
          SizedBox(height: 97.h),
          PrimaryButton(
            title: LocaleKeys.continuee.tr(),
            onTap: () {
              Navigator.pushNamed(context, Routes.homeTapScreen);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/auth/cubit/auth_cubit.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final IconData? icon;
  final TextInputType? keyboardType;
  const CustomTextField(
      {super.key,
      this.controller,
      this.labelText,
      this.validator,
      this.hintText,
      this.obscureText = false,
      this.icon,
      this.onChanged,
      this.onPressed,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText == false ? true : false,
        validator: validator,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(
              color: const Color(0xffE2E2E2),
              width: 1.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: Color(0xffE2E2E2),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(
              color: const Color(0xffE2E2E2),
              width: 1.w,
            ),
          ),
          filled: true,
          fillColor: const Color(0xffF7F5F9),
          labelText: labelText,
          hintText: hintText,
          suffixIcon: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return IconButton(
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  color: const Color(0xffB0B0B0),
                  size: 20.sp,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

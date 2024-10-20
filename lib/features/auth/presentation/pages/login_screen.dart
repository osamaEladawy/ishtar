import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/features/auth/domain/entities/country_model.dart';
import 'package:ishtar/features/auth/presentation/widgets/login_or_register.dart';

class LoginScreen extends StatelessWidget {
  final CountryModel countryModel;
  const LoginScreen({super.key, required this.countryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 40.w),
          alignment: Alignment.center,
          child: const LoginOrRegister(),
        ),
      ),
    );
  }
}

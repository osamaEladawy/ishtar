import 'package:flutter/material.dart';
import 'package:ishtar/app/constant.dart';
import 'package:ishtar/common/widget/custom_container_ishtar.dart';
import 'package:ishtar/config/routes_manager.dart';

import '../../../config/resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getFirst();
    // Future.delayed(const Duration(milliseconds: 3000), () {
    
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051336),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageManger.logo),
          ),
        ),
        child: const CustomContainerIshtar(),
      ),
    );
  }
   getFirst() async {
    await Constant.getLocation(context);
     Navigator.pushReplacementNamed(context, Routes.welcomeScreen);
  }
}

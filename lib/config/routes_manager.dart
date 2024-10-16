import 'package:flutter/material.dart';
import 'package:ishtar/features/auth/presentation/pages/get_info_screen.dart';
import 'package:ishtar/features/auth/presentation/pages/login_screen.dart';
import 'package:ishtar/features/auth/presentation/pages/verfication_code_screen.dart';
import 'package:ishtar/features/auth/presentation/pages/welcome_screen.dart';

import '../features/splash/screen/splash_screen.dart';
import 'app_strings.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardScreen = 'onBoardScreen';
  static const String welcomeScreen = 'welcomeScreen';
  static const String homeScreen = 'homeScreen';
  static const String loginScreen = 'loginScreen';
  static const String verificationCodeScreen = 'verificationCodeScreen';
  static const String getInfoScreen = 'getInfoScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    // var arg = setting.arguments;
    var routeName = setting.name;
    switch (routeName) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.verificationCodeScreen:
        return MaterialPageRoute(
            builder: (_) => const VerificationCodeScreen());
      case Routes.getInfoScreen:
        return MaterialPageRoute(builder: (_) => const GetInfoScreen());

      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}

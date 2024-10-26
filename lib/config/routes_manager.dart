import 'package:flutter/material.dart';
import 'package:ishtar/features/auth/domain/entities/country_model.dart';
import 'package:ishtar/features/auth/presentation/pages/choose_lang_and_country_screen.dart';
import 'package:ishtar/features/auth/presentation/pages/choose_type_service_screen.dart';
import 'package:ishtar/features/auth/presentation/pages/select_doctor.dart';
import 'package:ishtar/features/auth/presentation/pages/login_screen.dart';
import 'package:ishtar/features/auth/presentation/pages/next_service_provider_screen.dart';
import 'package:ishtar/features/auth/presentation/pages/select_visitor_screen.dart';
import 'package:ishtar/features/auth/presentation/pages/verfication_code_screen.dart';
import 'package:ishtar/features/auth/presentation/pages/welcome_screen.dart';
import 'package:ishtar/features/chats/models/chats_model.dart';
import 'package:ishtar/features/chats/screen/chat_info_screen.dart';
import 'package:ishtar/features/choose_your_package/screen/choose_package_screen.dart';
import 'package:ishtar/features/choose_your_package/screen/free_screen.dart';
import 'package:ishtar/features/choose_your_package/screen/gold_screen.dart';
import 'package:ishtar/features/choose_your_package/screen/silver_screen.dart';
import 'package:ishtar/features/home/models/hostpital_model.dart';
import 'package:ishtar/features/home/screen/details_screen.dart';
import 'package:ishtar/features/home/screen/home_screen.dart';
import 'package:ishtar/features/home_tap/screen/home_tap_screen.dart';
import 'package:ishtar/features/map/screen/map_screen.dart';
import 'package:ishtar/features/profile/screen/choose_area_screen.dart';
import 'package:ishtar/features/profile/screen/choose_province_screen.dart';
import 'package:ishtar/features/profile/screen/choose_the_right_date.dart';
import 'package:ishtar/features/profile/screen/choose_your_location_screen.dart';
import 'package:ishtar/features/profile/screen/services_and_specializations_screen.dart';
import 'package:ishtar/features/services/screen/services_screen.dart';

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
  static const String nextServiceProviderScreen = 'nextServiceProviderScreen';
  static const String selectVisitorScreen = 'selectVisitorScreen';
  static const String homeTapScreen = 'homeTapScreen';
  static const String chooseLangAndCountryScreen = 'chooseLangAndCountryScreen';
  static const String goldScreen = 'goldScreen';
  static const String silverScreen = 'silverScreen';
  static const String choosePackage = 'choosePackage';
  static const String freeScreen = 'freeScreen';
  static const String selectDoctorScreen = 'selectDoctorScreen';
  static const String chatInfoScreen = 'chatInfoScreen';
  static const String servicesScreen = 'servicesScreen';
  static const String detailsScreen = 'detailsScreen';
  static const String chooseAreaScreen = 'chooseAreaScreen';
  static const String chooseProvinceScreen = 'chooseProvinceScreen';
  static const String selectYourLocation = 'selectYourLocation';
  static const String servicesAndSpecializationsScreen = 'servicesAndSpecializationsScreen';
  static const String chooseTheRightDate = 'chooseTheRightDate';
  static const String chooseTypeServiceScreen = 'chooseTypeServiceScreen';
  static const String mapScreen = 'mapScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    var arg = setting.arguments;
    var routeName = setting.name;
    switch (routeName) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.mapScreen:
        return MaterialPageRoute(builder: (_) => const MapScreen());
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.chooseTypeServiceScreen:
        return MaterialPageRoute(builder: (_) => const ChooseTypeServiceScreen());
      case Routes.selectYourLocation:
        return MaterialPageRoute(
            builder: (_) => const ChooseYourLocationScreen());
      case Routes.chooseTheRightDate:
        return MaterialPageRoute(
            builder: (_) => const ChooseTheRightDate());
      case Routes.servicesScreen:
        return MaterialPageRoute(builder: (_) => const ServicesScreen());
      case Routes.servicesAndSpecializationsScreen:
        return MaterialPageRoute(builder: (_) => const ServicesAndSpecializationsScreen());
      case Routes.chooseAreaScreen:
        if (arg is String) {
          return MaterialPageRoute(
              builder: (_) => ChooseAreaScreen(cityName: arg));
        } else {
          return unDefineRoute();
        }
      case Routes.chooseProvinceScreen:
        return MaterialPageRoute(builder: (_) => const ChooseProvinceScreen());
      case Routes.detailsScreen:
        if (arg is MyModel) {
          return MaterialPageRoute(builder: (_) => DetailsScreen(myModel: arg));
        } else {
          return unDefineRoute();
        }
      case Routes.verificationCodeScreen:
        return MaterialPageRoute(
            builder: (_) => const VerificationCodeScreen());
      case Routes.selectDoctorScreen:
        return MaterialPageRoute(builder: (_) => const SelectDoctorScreen());
      case Routes.nextServiceProviderScreen:
        return MaterialPageRoute(
            builder: (_) => const NextServiceProviderScreen());
      case Routes.selectVisitorScreen:
        return MaterialPageRoute(builder: (_) => const SelectVisitorScreen());
      case Routes.homeTapScreen:
        return MaterialPageRoute(builder: (_) => const HomeTapScreen());
      case Routes.chooseLangAndCountryScreen:
        return MaterialPageRoute(
            builder: (_) => const ChooseLangAndCountryScreen());
      case Routes.goldScreen:
        return MaterialPageRoute(builder: (_) => const GoldScreen());
      case Routes.silverScreen:
        return MaterialPageRoute(builder: (_) => const SilverScreen());
      case Routes.choosePackage:
        return MaterialPageRoute(
            builder: (_) => const ChoosePackageScreenOne());
      case Routes.freeScreen:
        return MaterialPageRoute(builder: (_) => const FreeScreen());
      case Routes.chatInfoScreen:
        if (arg is ChatModel) {
          return MaterialPageRoute(
            builder: (_) => ChatInfoScreen(
              chatModel: arg,
            ),
          );
        } else {
          return unDefineRoute();
        }

      case Routes.loginScreen:
        if (arg is CountryModel) {
          return MaterialPageRoute(
            builder: (_) => LoginScreen(
              countryModel: arg,
            ),
          );
        } else {
          return unDefineRoute();
        }

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

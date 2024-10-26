import 'package:get_it/get_it.dart';
import 'package:ishtar/common/cubit/location_bloc/location_cubit.dart';
import 'package:ishtar/features/auth/auth_injection.dart';
import 'package:ishtar/features/chats/chats_injection.dart';
import 'package:ishtar/features/choose_your_package/choose_package.dart';
import 'package:ishtar/features/home/home_injection.dart';
import 'package:ishtar/features/home_tap/home_tap_injection.dart';
import 'package:ishtar/features/map/map_injection.dart';
import 'package:ishtar/features/profile/profile_injection.dart';
import 'package:ishtar/features/services/services_injection.dart';
import 'package:ishtar/features/splash/splash_injection.dart';
import 'package:ishtar/features/my_ads/my_ads_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  ///features

  initSplashInjection();
  authInjection();
  homeTapInjection();
  homeInjection();
  choosePackageInjection();
  chatsInjection();
  servicesInjection();
  profileInjection();
  myAdsInjection();
  mapInjection();

  getIt.registerFactory<LocationCubit>(() => LocationCubit());

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}

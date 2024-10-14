import 'package:get_it/get_it.dart';
import 'package:ishtar/common/cubit/location_bloc/location_cubit.dart';
import 'package:ishtar/features/auth/auth_injection.dart';
import 'package:ishtar/features/splash/splash_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  ///features

  initSplashInjection();
  authInjection();
  // initOnBoardingInjection();
  // initHomeInjection();
  // initHomeTapInjection();
  // initMyRideInjection();
  // offerRideInjection();
  // initializeNotificationInjection();
  // findRideInjection();
  // mapViewInJection();
  // requestRideInjection();
  // profileInjection();
  // languageInjection();

  getIt.registerFactory<LocationCubit>(() => LocationCubit());

  // getIt.registerLazySingleton(() => http.Client());
  //getIt.registerLazySingleton(() => InternetConnectionChecker());
  // s1.registerLazySingleton(() => http.Client());
  // s1.registerLazySingleton(() => InternetConnectionChecker());
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}

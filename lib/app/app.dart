import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/features/chats/cubit/chats_cubit.dart';
import 'package:ishtar/features/choose_your_package/cubit/choose_package_cubit.dart';
import 'package:ishtar/features/home/cubit/home_cubit.dart';
import 'package:ishtar/features/home_tap/cubit/home_tap_cubit.dart';
import 'package:ishtar/features/map/cubit/map_cubit.dart';
import 'package:ishtar/features/profile/cubit/profile_cubit.dart';
import 'package:ishtar/features/services/cubit/services_cubit.dart';
import 'package:ishtar/features/my_ads/cubit/my_ads_cubit.dart';

import '../build_injection.dart';
import '../common/cubit/location_bloc/location_cubit.dart';
import '../config/routes_manager.dart';
import '../features/auth/cubit/auth_cubit.dart';
import '../features/splash/screen/splash_screen.dart';
import '../theme/light_theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
            BlocProvider<MyAdsCubit>(create: (context) => getIt<MyAdsCubit>()),
            BlocProvider<MapCubit>(create: (context) => getIt<MapCubit>()),
            BlocProvider<ChoosePackageCubit>(
                create: (context) => getIt<ChoosePackageCubit>()),
            BlocProvider<LocationCubit>(
                create: (context) => getIt<LocationCubit>()),
            BlocProvider<HomeTapCubit>(
                create: (context) => getIt<HomeTapCubit>()),
            BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
            BlocProvider<ChatsCubit>(create: (context) => getIt<ChatsCubit>()),
            BlocProvider<ServicesCubit>(
                create: (context) => getIt<ServicesCubit>()),
            BlocProvider<ProfileCubit>(
                create: (context) => getIt<ProfileCubit>()),
          ],
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              useInheritedMediaQuery: true,
              debugShowCheckedModeBanner: false,
              title: 'Car Pooling',
              navigatorKey: navigatorKey,
              onGenerateRoute: RouteGenerator.getRoute,
              // initialRoute: Routes.homeTapScreen,
              theme: light,
              home: child,
            ),
          ),
        );
      },

      child: const SplashScreen(),
      // child: const ProfileScreen(),
      // child: const AboutUsScreen(),
      //  child: const CartScreen(),
    );
  }
}

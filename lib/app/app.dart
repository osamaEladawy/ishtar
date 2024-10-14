import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/features/auth/presentation/manager/cubit/auth_cubit.dart';

import '../build_injection.dart';
import '../common/cubit/location_bloc/location_cubit.dart';
import '../config/routes_manager.dart';
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
            BlocProvider<LocationCubit>(create: (context) => getIt<LocationCubit>()),
           //BlocProvider<ProfileCubit>(create: (context) => getIt<ProfileCubit>()),
           // BlocProvider<LanguageCubit>(create: (context) => getIt<LanguageCubit>()),
            //BlocProvider<MyRiderCubit>(create: (context) => getIt<MyRiderCubit>()),
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

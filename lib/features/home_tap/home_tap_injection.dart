import 'package:ishtar/build_injection.dart';
import 'package:ishtar/features/home_tap/cubit/home_tap_cubit.dart';

void homeTapInjection(){
  getIt.registerFactory<HomeTapCubit>(()=>HomeTapCubit());
}
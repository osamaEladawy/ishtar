import 'package:ishtar/build_injection.dart';
import 'package:ishtar/features/profile/cubit/profile_cubit.dart';

void profileInjection(){
  getIt.registerFactory<ProfileCubit>(()=>ProfileCubit());
}
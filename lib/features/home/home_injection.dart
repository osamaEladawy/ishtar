import 'package:ishtar/build_injection.dart';
import 'package:ishtar/features/home/cubit/home_cubit.dart';

void homeInjection(){
  getIt.registerFactory<HomeCubit>(()=>HomeCubit());
}
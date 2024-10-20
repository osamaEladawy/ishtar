import 'package:ishtar/build_injection.dart';
import 'package:ishtar/features/choose_your_package/cubit/choose_package_cubit.dart';

void choosePackageInjection(){
  getIt.registerFactory<ChoosePackageCubit>(()=>ChoosePackageCubit());
}
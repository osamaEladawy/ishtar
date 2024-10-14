import 'package:ishtar/build_injection.dart';
import 'package:ishtar/features/auth/presentation/manager/cubit/auth_cubit.dart';

void authInjection(){
  getIt.registerFactory<AuthCubit>(()=>AuthCubit());
}
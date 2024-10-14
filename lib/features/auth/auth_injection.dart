import 'package:ishtar/build_injection.dart';

import 'cubit/auth_cubit.dart';

void authInjection(){
  getIt.registerFactory<AuthCubit>(()=>AuthCubit());
}
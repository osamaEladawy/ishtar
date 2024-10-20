import 'package:ishtar/build_injection.dart';
import 'package:ishtar/features/services/cubit/services_cubit.dart';

void servicesInjection(){

  getIt.registerFactory<ServicesCubit>(()=> ServicesCubit());
}
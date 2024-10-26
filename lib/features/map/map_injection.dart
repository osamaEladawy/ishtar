import 'package:ishtar/build_injection.dart';
import 'package:ishtar/features/map/cubit/map_cubit.dart';

void mapInjection(){

  getIt.registerFactory<MapCubit>(()=>MapCubit());
}
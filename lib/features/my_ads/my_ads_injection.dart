import 'package:ishtar/build_injection.dart';
import 'package:ishtar/features/my_ads/cubit/my_ads_cubit.dart';

void myAdsInjection (){
  getIt.registerFactory<MyAdsCubit>(()=>MyAdsCubit());
}
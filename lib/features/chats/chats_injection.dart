import 'package:ishtar/build_injection.dart';
import 'package:ishtar/features/chats/cubit/chats_cubit.dart';

void chatsInjection(){
  getIt.registerFactory<ChatsCubit>(()=>ChatsCubit());
}
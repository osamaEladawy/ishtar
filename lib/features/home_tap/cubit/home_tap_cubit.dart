import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/chats/screen/chats_screen.dart';
import 'package:ishtar/features/home/screen/home_page.dart';
import 'package:ishtar/features/profile/screen/profile_screen.dart';
import 'package:ishtar/features/my_ads/screen/my_ads_screen.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

part 'home_tap_state.dart';

class HomeTapCubit extends Cubit<HomeTapState> {
  HomeTapCubit() : super(HomeTapInitial());

  static final HomeTapCubit _homeTapCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static HomeTapCubit get instance => _homeTapCubit;

  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    emit(ChangePage(page: currentIndex));
    emit(ChangeColor());
  }

  List<Widget> pages = [
   // ChooseCountryScreen(),
    // InitialScreen(),
    // HomeScreen(),
    //FavScreen(),
    // FavoritesScreen(),
    HomePage(),
     //CategoryScreen(),
    ChatsScreen(),
    MyAdsScreen(),
    ProfileScreen(),
  ];

  List words = [
    {"title": LocaleKeys.home.tr(), "icon": IconsManger.home},
    {"title": LocaleKeys.messages.tr(), "icon": IconsManger.messages},
    {"title": LocaleKeys.myAds.tr(), "icon": IconsManger.notification},
    {"title": LocaleKeys.profile.tr(), "icon": IconsManger.profile},
  ];
}

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/chats/screen/chats_screen.dart';
import 'package:ishtar/features/home/screen/fav_screen.dart';
import 'package:ishtar/features/home/screen/favourites_screen.dart';
import 'package:ishtar/features/home/screen/home_screen.dart';
import 'package:ishtar/features/home/screen/initial_screen.dart';
import 'package:ishtar/features/services/screen/services_screen.dart';
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
    InitialScreen(),
    //HomeScreen(),
    // FavScreen(),
    //FavoritesScreen(),
    //ServicesScreen(),
    ChatsScreen(),
    Center(child: Text("notification")),
    Center(child: Text("profile")),
  ];

  List words = [
    {"title": LocaleKeys.home.tr(), "icon": IconsManger.home},
    {"title": LocaleKeys.messages.tr(), "icon": IconsManger.messages},
    // {"title": "", "icon": IconsManger.button},
    {
      "title": LocaleKeys.myAdvertisement.tr(),
      "icon": IconsManger.notification
    },
    {"title": LocaleKeys.profile.tr(), "icon": IconsManger.profile},
  ];

  List<BottomNavigationBarItem> tabItems() => [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconsManger.home,
            color: currentIndex == 0
                ? Theme.of(navigatorKey.currentContext!).primaryColor
                : null,
          ),
          label: LocaleKeys.home.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconsManger.messages,
            color: currentIndex == 1
                ? Theme.of(navigatorKey.currentContext!).primaryColor
                : null,
          ),
          label: LocaleKeys.messages.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconsManger.button,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconsManger.notification,
            color: currentIndex == 3
                ? Theme.of(navigatorKey.currentContext!).primaryColor
                : null,
          ),
          label: LocaleKeys.myAdvertisement.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconsManger.profile,
            color: currentIndex == 4
                ? Theme.of(navigatorKey.currentContext!).primaryColor
                : null,
          ),
          label: LocaleKeys.profile.tr(),
        ),
      ];
}

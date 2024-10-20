import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/features/choose_your_package/screen/free_screen.dart';
import 'package:ishtar/features/choose_your_package/screen/gold_screen.dart';
import 'package:ishtar/features/choose_your_package/screen/silver_screen.dart';
import 'package:ishtar/features/home_tap/cubit/home_tap_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

part 'choose_package_state.dart';

class ChoosePackageCubit extends Cubit<ChoosePackageState> {
  ChoosePackageCubit() : super(ChoosePackageInitial());

  static final ChoosePackageCubit _choosePackageCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static ChoosePackageCubit get instance => _choosePackageCubit;

  int currentIndex = 0;

  void selectContainer(int index) {
    currentIndex = index;
    emit(ChangeValue(index: currentIndex));
    emit(ChangColor());
  }

  List<String> words = [
    LocaleKeys.free.tr(),
    LocaleKeys.gold.tr(),
    LocaleKeys.silver.tr(),
  ];

  List<Widget> pages = [
    FreeScreen(),
    GoldScreen(),
    SilverScreen(),
  ];
}

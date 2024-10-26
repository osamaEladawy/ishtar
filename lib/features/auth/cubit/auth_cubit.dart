import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/auth/domain/entities/country_model.dart';
import 'package:ishtar/features/auth/domain/entities/option_model.dart';
import 'package:ishtar/features/auth/presentation/pages/select_doctor.dart';
import 'package:ishtar/features/auth/presentation/pages/select_visitor_screen.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static final AuthCubit _authCubit =
      BlocProvider.of(navigatorKey.currentContext!);

  static AuthCubit get instance => _authCubit;

  bool isDisabled = false;
  bool value = false;

  int selectCountries = 0;
  int selectMyCountry = 0;
  void selectCountry(int index) {
    selectCountries = index;
    emit(SelectCountry(index: selectCountries));
    emit(const ChangeColor());
  }

  void selectedMyCountry(int index) {
    selectMyCountry = index;
    emit(SelectCountry(index: selectMyCountry));
    emit(const ChangeColor());
  }

  void checkBox() {
    value = !value;
    emit(Agree(isSelected: value));
    emit(const ChangeColor());
  }

  showPassword() {
    isDisabled = isDisabled == false ? true : false;
    emit(DisplayPass(isShowPass: isDisabled));
    emit(const ChangeColor());
  }

  IconData? icon() {
    if (isDisabled) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }

  //lang screen
  int selectLang = 0;
  void selectLanguage(int index) {
    selectLang = index;
    emit(SelectLang(index: selectLang));
    emit(const ChangeColor());
  }

  List<Widget> pages = [
    SelectDoctorScreen(),
    SelectVisitorScreen(),
  ];

  List<String> langs = [LocaleKeys.arabic.tr(), LocaleKeys.english.tr()];

  ///get info screen
  int selectDocOrVisible = 0;
  int selectHosOrDoc = 0;

  List<CountryModel> countries = [
    CountryModel(name: "مصر", flag: ImageManger.egypt),
    CountryModel(name: "السعوديه", flag: ImageManger.saudiArabia),
    CountryModel(name: "الامارات", flag: ImageManger.united),
    CountryModel(name: "عمان", flag: ImageManger.oman),
    CountryModel(name: "العراق", flag: ImageManger.iraq),
    CountryModel(name: "الكويت", flag: ImageManger.kuwait),
  ];

  List<OptionModel> options = [
    OptionModel(title: LocaleKeys.hospital.tr(), image: IconsManger.hosp),
    OptionModel(title: LocaleKeys.doctor.tr(), image: IconsManger.doctor),
    OptionModel(title: LocaleKeys.laboratory.tr(), image: IconsManger.m5tabr),
  ];

  List<OptionModel> options2 = [
    OptionModel(title: LocaleKeys.doc.tr(), image: IconsManger.doc),
    OptionModel(title: LocaleKeys.tourist.tr(), image: IconsManger.visit),
  ];

  List<OptionModel> options3 = [
    OptionModel(
        title: LocaleKeys.touristAreas.tr(), image: IconsManger.landscape),
    OptionModel(title: LocaleKeys.restaurants.tr(), image: IconsManger.rest),
    OptionModel(title: LocaleKeys.hotels.tr(), image: IconsManger.hotel),
  ];

  List<OptionModel> options4 = [
    OptionModel(title: LocaleKeys.doc.tr(), image: IconsManger.doc),
    OptionModel(title: LocaleKeys.tourist.tr(), image: IconsManger.visit),
  ];

  List<String> titles = [];
  List<String> titles2 = [
    LocaleKeys.hospital.tr(),
    LocaleKeys.doctor.tr(),
    LocaleKeys.laboratory.tr(),
  ];

  void setSelectHosDoc(int value) {
    selectHosOrDoc = value;
    emit(SelectDoc(index: selectHosOrDoc));
    emit(const ChangeColor());
  }

  void setSelectDoc(int value) {
    selectDocOrVisible = value;
    emit(SelectDoc(index: selectDocOrVisible));
    emit(const ChangeColor());
  }
}

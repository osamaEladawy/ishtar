import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishtar/app/app.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static final AuthCubit _authCubit =
      BlocProvider.of(navigatorKey.currentContext!);

  static AuthCubit get instance => _authCubit;

  bool isDisabled = false;
  bool value = false;

  checkBox() {
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

  ///get info screen
  int selectDocOrVisible = 0;
  int selectHosOrDoc = 0;

  List<String> titles = [
    "طبيبه",
    "سياحية",
  ];
  List<String> titles2 = [
    "مستشفى",
    "دكتور",
    "مختبر",
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

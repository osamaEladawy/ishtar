import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishtar/app/app.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static final AuthCubit _authCubit = BlocProvider.of(navigatorKey.currentContext!);

  static AuthCubit get instance => _authCubit;

  bool isDisabled = false;
  bool value = false;

  checkBox() {
    value = !value;
    emit(Agree(isSelected: value));
  }

  showPassword() {
    isDisabled = isDisabled == false ? true : false;
    emit(DisplayPass(isShowPass: isDisabled));
  }

  IconData? icon() {
    if (isDisabled) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }
}

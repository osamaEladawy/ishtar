part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class DisplayPass extends AuthState {
  final bool isShowPass;

  const DisplayPass({required this.isShowPass});
}

final class Agree extends AuthState {
  final bool isSelected;

  const Agree({required this.isSelected});
}

//get info screen

final class SelectDoc extends AuthState {
  final int index;

  const SelectDoc({required this.index});
}

final class ChangeColor extends AuthState {
  const ChangeColor();
}

final class SelectLang extends AuthState{
  final int index;

  const SelectLang({required this.index});
}

final class SelectCountry extends AuthState{
  final int index;

  SelectCountry({required this.index});
}
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

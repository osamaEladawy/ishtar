part of 'home_tap_cubit.dart';

sealed class HomeTapState extends Equatable {
  const HomeTapState();

  @override
  List<Object> get props => [];
}

final class HomeTapInitial extends HomeTapState {}
final class ChangePage extends HomeTapState {
  final int page;

  const ChangePage({required this.page });
}

final class ChangeColor extends HomeTapState {}

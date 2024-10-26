part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}
final class SelectFav extends HomeState {
  final int index;

  const SelectFav({required this.index});
}

final class ChangeValue extends HomeState {}
final class SelectOptions extends HomeState {
  final int index;

  const SelectOptions({required this.index});
}

final class SelectCategory extends HomeState{
  final int index;

  const SelectCategory({required this.index});
}


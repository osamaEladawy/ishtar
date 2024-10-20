part of 'choose_package_cubit.dart';

sealed class ChoosePackageState extends Equatable {
  const ChoosePackageState();

  @override
  List<Object> get props => [];
}

final class ChoosePackageInitial extends ChoosePackageState {}
final class ChangeValue extends ChoosePackageState {
  final int index;

  const ChangeValue({required this.index});
}
final class ChangColor extends ChoosePackageState {}

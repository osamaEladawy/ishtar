part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}
final class UsedSlider extends ProfileState {
  final double value;

  const UsedSlider({required this.value });

  @override
  List<Object> get props => [value];
}

final class SelectMyServices extends ProfileState{
  final int value;

  const SelectMyServices({required this.value});
}

final class ChangeMyColor extends ProfileState {}
final class SelectRadio extends ProfileState {
  final int value;

  const SelectRadio({required this.value});
}

final class SelectMyText extends ProfileState{
  final int value;

  const SelectMyText({required this.value});
} 

final class SelectCategory  extends ProfileState{
  final int value;

  const SelectCategory({required this.value});
}
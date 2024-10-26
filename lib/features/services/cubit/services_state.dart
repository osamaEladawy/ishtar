part of 'services_cubit.dart';

sealed class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object> get props => [];
}

final class ServicesInitial extends ServicesState {}

final class SelectServices extends ServicesState {
  final int value;

  const SelectServices({required this.value});
}

final class ChangeColor extends ServicesState {
  const ChangeColor();
}

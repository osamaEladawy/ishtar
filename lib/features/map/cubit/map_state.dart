part of 'map_cubit.dart';

sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

final class MapInitial extends MapState {}

final class ChangedIndex extends MapState {
  final int index;

  const ChangedIndex(this.index);
}

final class ChangeColor extends MapState {}

final class ChangedSlider extends MapState {
  final int value;

  const ChangedSlider(this.value);
}

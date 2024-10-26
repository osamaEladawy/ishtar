import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  static final MapCubit _mapCubit = BlocProvider.of(navigatorKey.currentContext!);
  static MapCubit get instance => _mapCubit;


  int slider = 0;

  void useSlider(int slider){
    this.slider = slider;
    emit(ChangedSlider(slider));
    emit(ChangeColor());
  }

  int currentIndex = 0;

  void setMapCenter(int index) {
    currentIndex = index;
    emit(ChangedIndex(currentIndex));
    emit(ChangeColor());
    //emit(MapCenterChanged(latitude, longitude));
  }

  List<String>word = [
    LocaleKeys.application.tr(),
    LocaleKeys.reset.tr(),
  ];
}

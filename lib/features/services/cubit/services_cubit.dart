import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/services/models/category_model.dart';
import 'package:ishtar/features/services/screen/medical_services_screen.dart';
import 'package:ishtar/features/services/screen/tourist_services_screen.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());

  static final ServicesCubit _servicesCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static ServicesCubit get instance => _servicesCubit;
  int currentIndex = 0;

  void selectServices(int index) {
    currentIndex = index;
    emit(SelectServices(value: currentIndex));
    emit(ChangeColor());
  }

  List<CategoryModel> categories = [
    CategoryModel(
      id: 1,
      categoryName: LocaleKeys.doctors.tr(),
      image: ImageManger.doctors,
    ),
    CategoryModel(
      id: 2,
      categoryName: LocaleKeys.laboratory.tr(),
      image: ImageManger.m5tbr,
    ),
    CategoryModel(
      id: 3,
      categoryName: LocaleKeys.hospital.tr(),
      image: ImageManger.hospitals,
    ),
    CategoryModel(
      id: 4,
      categoryName: LocaleKeys.clinics.tr(),
      image: ImageManger.clincs,
    ),
    CategoryModel(
      id: 5,
      categoryName: LocaleKeys.nursing.tr(),
      image: ImageManger.nurses,
    ),
  ];
  List<CategoryModel> categories1 = [
    CategoryModel(
      id: 1,
      categoryName: LocaleKeys.airlines.tr(),
      image: ImageManger.airplane,
    ),
    CategoryModel(
      id: 2,
      categoryName: LocaleKeys.hotels.tr(),
      image: ImageManger.hotel,
    ),
    CategoryModel(
      id: 3,
      categoryName: LocaleKeys.restaurants.tr(),
      image: ImageManger.restaurant,
    ),
    CategoryModel(
      id: 4,
      categoryName: LocaleKeys.touristAreas.tr(),
      image: ImageManger.map,
    ),
  ];

  List info = [
    {
      "title": LocaleKeys.touristServices.tr(),
      "icon": ImageManger.travelLuggage,
      "cover": ImageManger.rectangle1,
    },
    {
      "title": LocaleKeys.medicalServices.tr(),
      "icon": ImageManger.healthcare,
      "cover": ImageManger.rectangle2,
    }
  ];

  List<Widget> pages = [
    TouristServicesScreen(),
    MedicalServicesScreen(),
  ];
}

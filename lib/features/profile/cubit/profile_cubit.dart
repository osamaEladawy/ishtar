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

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static final ProfileCubit _profileCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static ProfileCubit get instance => _profileCubit;

  double value = 0;
  int isSelectRadio = 0;
  int selectText = 0;

  void selectRadio(int radio) {
    isSelectRadio = radio;
    emit(SelectRadio(value: isSelectRadio));
    emit(ChangeMyColor());
  }

  void selectMyText(int text) {
    selectText = text;
    emit(SelectMyText(value: selectText));
    emit(ChangeMyColor());
  }

  void useSlider(double value) {
    this.value = value;
    emit(UsedSlider(value: this.value));
  }

  int currentIndex = 0;
  int selectedCategory = 0;

  void selectServices(int index) {
    currentIndex = index;
    emit(SelectMyServices(value: currentIndex));
    emit(ChangeMyColor());
  }

  List photos = [
    ImageManger.imgD5,
    ImageManger.imgD1,
    ImageManger.imgD2,
    ImageManger.imgD3,
    ImageManger.imgD6,
    ImageManger.imgD,
  ];
  List videos = [
    ImageManger.imgD4,
    ImageManger.vedio1,
    ImageManger.vedio5,
    ImageManger.vedio3,
    ImageManger.vedio2,
    ImageManger.vedio4,
  ];

  void selectCategory(int index) {
    selectedCategory = index;
    emit(SelectCategory(value: selectedCategory));
    emit(ChangeMyColor());
  }

  List categories = [
    LocaleKeys.confirmYourReservation.tr(),
    LocaleKeys.cancellation.tr()
  ];
  List<CategoryModel> specializations = [
    CategoryModel(
      id: 1,
      categoryName: LocaleKeys.dentist.tr(),
      image: ImageManger.teeth,
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

  List<String> infoDoc = [
    LocaleKeys.aboutTheDoctor.tr(),
    LocaleKeys.photos.tr(),
    LocaleKeys.videos.tr(),
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
    TouristServicesScreen(
      isServicesAndSpecializations: true,
    ),
    MedicalServicesScreen(
      isServicesAndSpecializations: true,
    ),
  ];

  List cities = [
    "القاهره",
    "اسكندرية",
    "اسماعلية",
    "الفيوم",
    "البحيرة",
  ];
  List areas = [
    "شبرا",
    "التجمع الخامس",
    "مدينة نصر",
    "مدينة الرحاب",
    "مصر الجديدة",
  ];
}

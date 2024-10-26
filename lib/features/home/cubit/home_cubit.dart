import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/home/models/comment_model.dart';
import 'package:ishtar/features/home/models/hostpital_model.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static final HomeCubit _homeCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static HomeCubit get instance => _homeCubit;

  bool isFav = false;
  int selectedItem = 0;
  int selectedOption = 0;
  int selectedCategory = 0;
  Map<String, dynamic> map = {};

  PageController controller = PageController();

  void favItem(key, value) {
    //id      //value
    map[key] = value;
    emit(ChangeValue());
  }

  void selectFavorite(int index) {
    selectedItem = index;
    isFav = !isFav;
    emit(SelectFav(index: selectedItem));
    emit(ChangeValue());
  }

  void selectCategory(int index) {
    selectedCategory = index;
    emit(SelectCategory(index: selectedCategory));
    emit(ChangeValue());
  }

  void selectOptions(int index) {
    selectedOption = index;
    emit(SelectOptions(index: selectedOption));
    emit(ChangeValue());
  }

  List titles = [
    {"title": "+20 0000  0000", "image": IconsManger.call_Incoming},
    {"title": LocaleKeys.chat.tr(), "image": IconsManger.messages_icon}
  ];
  List categories = [
    {"title": LocaleKeys.theVideos.tr(), "image": IconsManger.video},
    {"title": LocaleKeys.filterByMap.tr(), "image": IconsManger.mappppp}
  ];

  List<CommentModel> comments = [
    CommentModel(
      id: 1,
      userName: "اسم الشخص",
      image: ImageManger.pic3,
      comment: 'تعليق الشخص',
    ),
    CommentModel(
      id: 1,
      userName: "اسم الشخص",
      image: ImageManger.pic2,
      comment: 'تعليق الشخص',
    ),
    CommentModel(
      id: 1,
      userName: "اسم الشخص",
      image: ImageManger.pic1,
      comment: 'تعليق الشخص',
    ),
    CommentModel(
      id: 4,
      userName: "اسم الشخص",
      image: ImageManger.pic4,
      comment: 'تعليق الشخص',
    ),
    CommentModel(
      id: 5,
      userName: "اسم الشخص",
      image: ImageManger.pic5,
      comment: 'تعليق الشخص',
    ),
    CommentModel(
      id: 5,
      userName: "اسم الشخص",
      image: ImageManger.pic5,
      comment: 'تعليق الشخص',
    ),
    CommentModel(
      id: 5,
      userName: "اسم الشخص",
      image: ImageManger.pic5,
      comment: 'تعليق الشخص',
    ),
    CommentModel(
      id: 5,
      userName: "اسم الشخص",
      image: ImageManger.pic5,
      comment: 'تعليق الشخص',
    ),
    CommentModel(
      id: 5,
      userName: "اسم الشخص",
      image: ImageManger.pic5,
      comment: 'تعليق الشخص',
    ),
  ];

  List<MyModel> hospitals = [
    MyModel(
      id: 1,
      name: LocaleKeys.hospitalName.tr(),
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp,
      isFavorite: true,
    ),
    MyModel(
      id: 2,
      name: LocaleKeys.hospitalName.tr(),
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp1,
      isFavorite: false,
    ),
    MyModel(
      id: 3,
      name: LocaleKeys.hospitalName.tr(),
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp2,
      isFavorite: true,
    ),
    MyModel(
      id: 4,
      name: LocaleKeys.hospitalName.tr(),
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp3,
      isFavorite: false,
    ),
    // Add more hospitals here...
    MyModel(
      id: 5,
      name: LocaleKeys.hospitalName.tr(),
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp,
      isFavorite: false,
    ),
    MyModel(
      id: 6,
      name: LocaleKeys.hospitalName.tr(),
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp1,
      isFavorite: false,
    ),
    MyModel(
      id: 7,
      name: LocaleKeys.hospitalName.tr(),
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp2,
      isFavorite: false,
    ),
    MyModel(
      id: 8,
      name: LocaleKeys.hospitalName.tr(),
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp3,
      isFavorite: false,
    ),
  ];

  List<MyModel> models = [
    MyModel(
      id: 1,
      name: LocaleKeys.hospitalName.tr(),
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hotil,
      isFavorite: false,
    ),
    MyModel(
      id: 2,
      name: LocaleKeys.hospitalName.tr(),
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hotil,
      isFavorite: false,
    ),
    MyModel(
      id: 3,
      name: LocaleKeys.hospitalName.tr(),
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hotil,
      isFavorite: false,
    ),
  ];

  List<MyModel> touristServices = [
    MyModel(
      id: 1,
      name: "أسم المطعم هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.new_hotel,
      isFavorite: true,
    ),
    MyModel(
      id: 2,
      name: "أسم الشركة هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.travelo,
      isFavorite: false,
    ),
    MyModel(
      id: 3,
      name: "أسم المطعم هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.new_hotel,
      isFavorite: false,
    ),
  ];

  List<MyModel> medicalServices = [
    MyModel(
      id: 1,
      name: "أسم المستشفي هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp,
      isFavorite: true,
    ),
    MyModel(
      id: 2,
      name: "أسم العياده هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.clincccc,
      isFavorite: false,
    ),
    MyModel(
      id: 3,
      name: "أسم المستشفي هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp2,
      isFavorite: false,
    ),
  ];

  List<MyModel> optionServices = [
    MyModel(
      id: 1,
      name: "أسم المستشفي هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp,
      isFavorite: true,
    ),
    MyModel(
      id: 2,
      name: "أسم الفندق هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hotil,
      isFavorite: false,
    ),
    MyModel(
      id: 3,
      name: "أسم الشركة هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.msm,
      isFavorite: true,
    ),
    MyModel(
      id: 4,
      name: "أسم المطعم هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.company,
      isFavorite: false,
    ),
    MyModel(
      id: 5,
      name: "أسم العياده هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.clincccc,
      isFavorite: false,
    ),
    MyModel(
      id: 6,
      name: "أسم العياده هنا",
      address: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.clincccc,
      isFavorite: false,
    ),
  ];
}

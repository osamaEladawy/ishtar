import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
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
  Map<String, dynamic> map = {};

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

  List<HospitalModel> hospitals = [
    HospitalModel(
      id: 1,
      nameHospital: LocaleKeys.hospitalName.tr(),
      addressHospital: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp,
      isFavorite: false,
    ),
    HospitalModel(
      id: 2,
      nameHospital: LocaleKeys.hospitalName.tr(),
      addressHospital: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp1,
      isFavorite: false,
    ),
    HospitalModel(
      id: 3,
      nameHospital: LocaleKeys.hospitalName.tr(),
      addressHospital: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp2,
      isFavorite: false,
    ),
    HospitalModel(
      id: 4,
      nameHospital: LocaleKeys.hospitalName.tr(),
      addressHospital: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp3,
      isFavorite: false,
    ),
    // Add more hospitals here...
    HospitalModel(
      id: 5,
      nameHospital: LocaleKeys.hospitalName.tr(),
      addressHospital: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp,
      isFavorite: false,
    ),
    HospitalModel(
      id: 6,
      nameHospital: LocaleKeys.hospitalName.tr(),
      addressHospital: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp1,
      isFavorite: false,
    ),
    HospitalModel(
      id: 7,
      nameHospital: LocaleKeys.hospitalName.tr(),
      addressHospital: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp2,
      isFavorite: false,
    ),
    HospitalModel(
      id: 8,
      nameHospital: LocaleKeys.hospitalName.tr(),
      addressHospital: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hosp3,
      isFavorite: false,
    ),
  ];

  List<HospitalModel> models = [
    HospitalModel(
      id: 1,
      nameHospital: LocaleKeys.hospitalName.tr(),
      addressHospital: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hotil,
      isFavorite: false,
    ),
    HospitalModel(
      id: 2,
      nameHospital: LocaleKeys.hospitalName.tr(),
      addressHospital: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hotil,
      isFavorite: false,
    ),
    HospitalModel(
      id: 3,
      nameHospital: LocaleKeys.hospitalName.tr(),
      addressHospital: LocaleKeys.addressHospital.tr(),
      category: LocaleKeys.category.tr(),
      image: ImageManger.hotil,
      isFavorite: false,
    ),
  ];
}

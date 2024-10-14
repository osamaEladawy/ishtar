import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/config/app_text_styles.dart';

import '../common/cubit/location_bloc/location_cubit.dart';
import '../common/models/language_model.dart';
import '../config/app_strings.dart';

const Locale arabic = Locale('ar');
const Locale english = Locale('en');

class Constant {
  static LanguageModel? languageModel;
  static List<LanguageModel> languageList = [
    LanguageModel(id: 1, txt: AppStrings.english),
    LanguageModel(id: 2, txt: AppStrings.arabic),
  ];
  static Future<bool> getLocation(BuildContext context)async{
    // LocationCubit locationCubit = BlocProvider.of(context,listen: false);
    bool? getLocation = await LocationCubit.instance.getGeoLocation(context);
    if(getLocation == true){
      return true;
    }else{
      return false;
    }

  }
}

final titleAppBar = TextStyle(
    fontWeight: AppFontWeight.bold, fontSize: 18.sp, fontFamily: 'Inter');

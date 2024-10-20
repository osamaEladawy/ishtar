import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/features/services/screen/medical_services_screen.dart';
import 'package:ishtar/features/services/screen/tourist_services_screen.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());


   static final ServicesCubit _servicesCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static ServicesCubit get instance => _servicesCubit;



  List<Widget> pages =[
    MedicalServicesScreen(),
    TouristServicesScreen(),
  ];

  
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/config/resources.dart';

part 'my_ads_state.dart';

class MyAdsCubit extends Cubit<MyAdsState> {
  MyAdsCubit() : super(MyAdsInitial());

  static final MyAdsCubit _myAdsCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static MyAdsCubit get instance => _myAdsCubit;

  List ads = [
    ImageManger.cenima,
    ImageManger.unnamed,
    ImageManger.connect,
    ImageManger.cenima,
    ImageManger.unnamed,
    ImageManger.connect,
    ImageManger.cenima,
    ImageManger.unnamed,
    ImageManger.connect,
  ];


  
  CameraPosition? cameraPosition;
  GoogleMapController? completerController;
  Completer<GoogleMapController>? completer;

  List<Marker> markers = [];
  Position? currentPosition;

  getCurrentPositions(double lat,double lng) {
    cameraPosition = CameraPosition(
      target: LatLng(lat,lng),
      zoom: 12.0,
    );
    markers.add(
      Marker(
        markerId: const MarkerId("current"),
        position: LatLng(lat,lng),
      ),
    );
  }

  Future<bool> _handleLocationPermission(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    if (permission == LocationPermission.whileInUse) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are granted while in use. We recommend enabling background location services.')));

      return true;
    }
    return true;
  }

  Future<void> getCurrentPosition(context) async {
    final hasPermission = await _handleLocationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
      currentPosition = position;
    }).catchError((e) {
      debugPrint(e);
    });
  }
}

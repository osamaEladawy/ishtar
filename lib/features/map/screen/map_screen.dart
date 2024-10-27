import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/cutom_real_appBar.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/home/widgets/custom_text.dart';
import 'package:ishtar/features/map/cubit/map_cubit.dart';
import 'package:ishtar/features/my_ads/cubit/my_ads_cubit.dart';
import 'package:ishtar/translations/locale_keys.g.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  // @override
  // void initState() {
  //   super.initState();
  //   MyAdsCubit.instance.getCurrentPosition(context);
  // }

  @override
  void dispose() {
    super.dispose();
    MyAdsCubit.instance.completerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  BlocBuilder<MyAdsCubit, MyAdsState>(
                    builder: (context, state) {
                      return GoogleMap(
                        //mapType: MapType.terrain,
                        markers: MyAdsCubit.instance.markers.toSet(),
                        initialCameraPosition:
                            MyAdsCubit.instance.cameraPosition!,
                        onTap: (LatLng latLng) {},
                        onMapCreated: (controllerGoogle) {
                          try {
                            mapController = controllerGoogle;
                            //  RequestRideCubit.instance.completer!.complete(controllerGoogle);
                            setState(() {
                              controllerGoogle.setMapStyle('''
                              [
                            {
                              "elementType": "geometry",
                              "stylers": [
                                {
                          "color": "#f5f5f5"
                                }
                              ]
                            },
                            {
                              "elementType": "labels.icon",
                              "stylers": [
                                {
                          "visibility": "off"
                                }
                              ]
                            },
                            {
                              "elementType": "labels.text.fill",
                              "stylers": [
                                {
                          "color": "#616161"
                                }
                              ]
                            },
                            {
                              "elementType": "labels.text.stroke",
                              "stylers": [
                                {
                          "color": "#f5f5f5"
                                }
                              ]
                            },
                            {
                              "featureType": "administrative.land_parcel",
                              "elementType": "labels.text.fill",
                              "stylers": [
                                {
                          "color": "#bdbdbd"
                                }
                              ]
                            },
                            {
                              "featureType": "poi",
                              "elementType": "geometry",
                              "stylers": [
                                {
                          "color": "#eeeeee"
                                }
                              ]
                            },
                            {
                              "featureType": "poi",
                              "elementType": "labels.text.fill",
                              "stylers": [
                                {
                          "color": "#757575"
                                }
                              ]
                            },
                            {
                              "featureType": "poi.park",
                              "elementType": "geometry",
                              "stylers": [
                                {
                          "color": "#e5e5e5"
                                }
                              ]
                            },
                            {
                              "featureType": "poi.park",
                              "elementType": "labels.text.fill",
                              "stylers": [
                                {
                          "color": "#9e9e9e"
                                }
                              ]
                            },
                            {
                              "featureType": "road",
                              "elementType": "geometry",
                              "stylers": [
                                {
                          "color": "#ffffff"
                                }
                              ]
                            },
                            {
                              "featureType": "road.arterial",
                              "elementType": "labels.text.fill",
                              "stylers": [
                                {
                          "color": "#757575"
                                }
                              ]
                            },
                            {
                              "featureType": "road.highway",
                              "elementType": "geometry",
                              "stylers": [
                                {
                          "color": "#dadada"
                                }
                              ]
                            },
                            {
                              "featureType": "road.highway",
                              "elementType": "labels.text.fill",
                              "stylers": [
                                {
                          "color": "#616161"
                                }
                              ]
                            },
                            {
                              "featureType": "road.local",
                              "elementType": "labels.text.fill",
                              "stylers": [
                                {
                          "color": "#9e9e9e"
                                }
                              ]
                            },
                            {
                              "featureType": "transit.line",
                              "elementType": "geometry",
                              "stylers": [
                                {
                          "color": "#e5e5e5"
                                }
                              ]
                            },
                            {
                              "featureType": "transit.station",
                              "elementType": "geometry",
                              "stylers": [
                                {
                          "color": "#eeeeee"
                                }
                              ]
                            },
                            {
                              "featureType": "water",
                              "elementType": "geometry",
                              "stylers": [
                                {
                          "color": "#c9c9c9"
                                }
                              ]
                            },
                            {
                              "featureType": "water",
                              "elementType": "labels.text.fill",
                              "stylers": [
                                {
                          "color": "#9e9e9e"
                                }
                              ]
                            }
                          ]
                              ''');
                            });
                          } catch (e) {}
                        },
                      );
                    },
                  ),
                  Positioned(
                    top: 15.h,
                    left: 20.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRealAppBar(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                        SvgPicture.asset(IconsManger.notify),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 60.h,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      width: 350.w,
                      padding: EdgeInsets.only(
                          top: 14.h, left: 10.w, right: 10.w, bottom: 15.h),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff0000000F).withOpacity(0.2),
                            blurRadius: 13,
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                LocaleKeys.searchInScope.tr(),
                                textStyle: AppTextStyle.textStyle(
                                  appFontSize: 14.sp,
                                  appFontWeight: FontWeight.w700,
                                  appFontHeight: 26.24.sp,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '2.5 ',
                                      style: AppTextStyle.textStyle(
                                        appFontSize: 14.sp,
                                        appFontWeight: FontWeight.w700,
                                        appFontHeight: 26.24.sp,
                                        color: Color(0xff051336),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'كم',
                                      style: AppTextStyle.textStyle(
                                        appFontSize: 12.sp,
                                        appFontWeight: FontWeight.w500,
                                        appFontHeight: 22.49.sp,
                                        color: Color(0xff66666E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          BlocBuilder<MapCubit, MapState>(
                            builder: (context, state) {
                              return Slider(
                                  activeColor: Color(0xff188DFF),
                                  value: MapCubit.instance.slider.toDouble(),
                                  min: 0.0,
                                  max: 100,
                                  onChanged: (value) {
                                    MapCubit.instance.useSlider(value.toInt());
                                  });
                            },
                          ),
                          SizedBox(height: 22.h),
                          BlocBuilder<MapCubit, MapState>(
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ...List.generate(
                                      MapCubit.instance.word.length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        MapCubit.instance.setMapCenter(index);
                                      },
                                      child: CustomButton(
                                        title: MapCubit.instance.word[index],
                                        colorText:
                                            MapCubit.instance.currentIndex ==
                                                    index
                                                ? Color(0xffFFFFFF)
                                                : Color(0xff051336),
                                        colorContainer:
                                            MapCubit.instance.currentIndex ==
                                                    index
                                                ? Color(0xff188DFF)
                                                : Color(0xffE2E2E2),
                                      ),
                                    );
                                  }),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70.h,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          height: 44.h,
                          width: 350.w,
                          child: CustomTextFormField(
                            hintText: LocaleKeys.searchForLocation.tr(),
                          ),
                        ),
                        Positioned(
                          right: 35.w,
                          bottom: -14.h,
                          child: SvgPicture.asset(
                            IconsManger.searchIcon,
                            color: Color(0xffC3CBD3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.colorText,
    required this.colorContainer,
  });
  final String title;
  final Color colorText;
  final Color colorContainer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 160.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorContainer,
      ),
      child: TextWidget(
        title,
        textStyle: AppTextStyle.textStyle(
          appFontSize: 13.sp,
          appFontWeight: FontWeight.w700,
          appFontHeight: 24.36.sp,
          color: colorText,
          // Color(0xffFFFFFF),
        ),
      ),
    );
  }
}

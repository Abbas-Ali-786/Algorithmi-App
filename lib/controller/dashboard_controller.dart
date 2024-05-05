import 'package:algorthimi/controller/geo_location_controller.dart';
import 'package:algorthimi/utils/color_data.dart';
import 'package:algorthimi/view/DashboardScreens/start_questions_screen.dart';
import 'package:algorthimi/view/Widgets/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashBoardController extends GetxController{
  ///For freelancer dashboard


  LocationController locationController = Get.find(tag: 'locationController');
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};

  onMapCreated(GoogleMapController controller) async {
    controller = controller;
    String value =
    await DefaultAssetBundle.of(Get.context!).loadString('assets/map.json');
    controller.setMapStyle(value);
  }

  createMarker({markerColor, markerId, title, lat, long, context}) {
    markers.add(Marker(
      markerId: MarkerId(markerId),
      infoWindow: InfoWindow(title: title),
      icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
      position: LatLng(lat, long),
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          elevation: 5,
          builder: (BuildContext context) {
            return Container(
              width: 100.w,
              height: 37.h,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.px),
                      topRight: Radius.circular(15.px))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getCustomTextW6S17(
                              text: 'Questionnaire'.tr, color: greenColor),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: subTextColor,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      getVerSpace(1.h),
                      getCustomTextW6S12(
                          text:
                          '1) Does the location have a POS system.\n2) # of counters.\n3) Sales of tobacco.\n4) Attach image of tobacco shelf.\n5) Ask shop keep top selling brands.\n6) Sales of energy drinks.'
                              .tr,
                          color: subTextColor,
                          textAlign: TextAlign.start)
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => StartQuestionsScreen(
                                userType: 'freelancer',
                              ));
                            },
                            child: fillColorButton(
                                text: 'Accept'.tr,
                                color: pinkAppColor,
                                paddingVertical: 0.7.h),
                          )),
                      getHorSpace(1.h),
                      Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: outlineButton(
                                borderColor: pinkAppColor,
                                text: 'Cancel'.tr,
                                color: backgroundColor,
                                paddingVertical: 0.7.h),
                          )),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    ));
  }

}
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var lat = 0.0.obs;
  var lng = 0.0.obs;
  dynamic currentPosition;
  var currentAddress = ''.obs;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // get address
  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    lat.value = position.latitude;
    lng.value = position.longitude;

    Placemark place = placeMarks[0];
    currentAddress.value =
        '${place.street}, ${place.subLocality}, ${place.locality}';

    // log('Latitude: ${lat.value}');
    // log('Longitude: ${lng.value}');
    // log('place-marks: $placeMarks');
    // log('currentAddress: ${currentAddress.value}');
  }

  // get address
  getAddress() async {
    Position position = await _getGeoLocationPosition();
    await getAddressFromLatLong(position);
  }

  getPosition() async {
    Position position = await _getGeoLocationPosition();
    currentPosition = position;
    log('here is');
    await getAddressFromLatLong(currentPosition);
    log("Position: $currentPosition");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAddress();
  }
}

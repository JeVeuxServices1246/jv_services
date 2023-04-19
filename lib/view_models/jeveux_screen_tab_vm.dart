import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jv_services/view_models/base_vm.dart';

import '../utils/hive_utils.dart';
import '../utils/session_key.dart';

class JEveuxScreenVM extends BaseViewModel{
  int _controlValue = 0;
  String _currentAddress = "";
  Position? _currentPosition;


  @override
  initView() {
    getCurrentPosition();
    return super.initView();
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      getAddressFromLatLng(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }
  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress =
      '${place.street}${place.locality!.isNotEmpty ? ", ${place.locality}":""}${place.subAdministrativeArea!.isNotEmpty ? ", ${place.subAdministrativeArea}":""}, ${place.postalCode}';
    }).catchError((e) {
      debugPrint(e);
    });
  }
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location services are disabled. Please enable the services')));
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
          content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }


  String get currentAddress => _currentAddress;

  set currentAddress(String value) {
    _currentAddress = value;
    notifyListeners();
  }

  int get controlValue => _controlValue;

  set controlValue(int value) {
    _controlValue = value;
    notifyListeners();
  }

  Position? get currentPosition => _currentPosition;

  set currentPosition(Position? value) {
    _currentPosition = value;
    notifyListeners();
  }
}
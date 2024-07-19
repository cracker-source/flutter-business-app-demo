import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

import 'globals.dart';

// SHOW BOTTOM SHEET
void bottomSheetHandler(Widget widget, BuildContext context) {
  showModalBottomSheet<void>(
    useSafeArea: true,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    clipBehavior: Clip.hardEdge,
    enableDrag: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return widget;
    },
  );
}

// SHOW SNACKBAR
void showSnackBar(String content) {
  final SnackBar snackBar = SnackBar(
    content: Text(content),
    margin: const EdgeInsets.all(16),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
  );
  snackbarKey.currentState?.showSnackBar(snackBar);
}

// GET USER CURRENT LOCATION
Future<LocationData?> getUserCurrentLocation() async {
  Location location = Location();

  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  locationData = await location.getLocation();

  return locationData;
}

// GET MULTIPLE IMAGES
Future<List<XFile>> pickMultipleImages() async {
  final ImagePicker imagePicker = ImagePicker();

  final List<XFile> images = await imagePicker.pickMultiImage(
    imageQuality: 50,
    maxHeight: 480,
    maxWidth: 640,
  );

  return images;
}

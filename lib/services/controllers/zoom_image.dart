import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZoomCon extends GetxController {
  var selectedPageIndex = 0.obs;

  @override
  void onClose() {
    // pageController.dispose();
    super.onClose();
  }
}

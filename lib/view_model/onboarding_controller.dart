import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final TextEditingController controller = TextEditingController();
  bool hasSpecialCharacters = false;

  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      final value = controller.text;
      if (value.contains(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%$]'))) {
        hasSpecialCharacters = true;
      } else {
        hasSpecialCharacters = false;
      }
      update();
    });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

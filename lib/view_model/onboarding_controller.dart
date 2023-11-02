import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final TextEditingController controller = TextEditingController();
  RxBool hasSpecialCharacters = false.obs;

  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      final value = controller.text;
      if (value.contains(RegExp(r'[!@#<>?":.,_`~;/[\]\\|=+)(*&^%$]'))) {
        hasSpecialCharacters.value = true;
      } else if (value.contains(RegExp(r"['-]"))) {
        hasSpecialCharacters.value = true;
      } else {
        hasSpecialCharacters.value = false;
      }
    });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

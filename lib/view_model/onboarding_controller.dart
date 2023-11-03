import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final TextEditingController controller = TextEditingController();
  RxBool hasSpecialCharacters = false.obs;
  RxBool hasInput = false.obs;

  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      final value = controller.text;
      // 텍스트 필드에 값이 입력 되었는지 여부
      if (value.isNotEmpty) {
        hasInput.value = true;
      } else {
        hasInput.value = false;
      }
      // 특스문자를 입력했는지
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

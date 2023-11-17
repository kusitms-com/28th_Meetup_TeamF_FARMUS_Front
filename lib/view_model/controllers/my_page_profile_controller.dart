import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPageProfileController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  RxBool hasInput = RxBool(false);
  RxBool hasSpecialCharacters = RxBool(false);

  final contentValue = "".obs;

  @override
  void onInit() {
    super.onInit();
    updateTextfield();
  }

  void updateTextfield() {
    textEditingController.addListener(() {
      final value = textEditingController.text;
      if (value.isNotEmpty) {
        hasInput.value = true;
        print(value);
      } else {
        hasInput.value = false;
      }

      // 특수문자를 입력했는지
      if (value.contains(RegExp(r'[!@#<>?":.,_`~;/[\]\\|=+)(*&^%$]'))) {
        hasSpecialCharacters.value = true;
      } else if (value.contains(RegExp(r"['-]"))) {
        hasSpecialCharacters.value = true;
      } else {
        hasSpecialCharacters.value = false;
      }
    });
  }

  void updateContentValue(String value) {
    contentValue.value = value;
  }
}

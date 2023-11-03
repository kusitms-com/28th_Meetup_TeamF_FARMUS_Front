import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // 텍스트 입력 필드 컨트롤러
  final TextEditingController controller = TextEditingController();
  RxBool hasSpecialCharacters = false.obs;
  RxBool hasInput = false.obs;

  // 선택 박스 컨트롤러
  final isSelected1 = false.obs;
  final isSelected2 = false.obs;
  final isSelected3 = false.obs;
  final isSelected4 = false.obs;
  final isSelected5 = false.obs;
  final isSelected6 = false.obs;
  final isSelected7 = false.obs;
  final isSelected8 = false.obs;
  final isSelected9 = false.obs;
  final isSelected10 = false.obs;

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

  void selectBox1() {
    isSelected1.toggle();
  }

  void selectBox2() {
    isSelected2.toggle();
  }

  void selectBox3() {
    isSelected3.toggle();
  }

  void selectBox4() {
    isSelected4.toggle();
  }

  void selectBox5() {
    isSelected5.toggle();
  }

  void selectBox6() {
    isSelected6.toggle();
  }

  void selectBox7() {
    isSelected7.toggle();
  }

  void selectBox8() {
    isSelected8.toggle();
  }

  void selectBox9() {
    isSelected9.toggle();
  }

  void selectBox10() {
    isSelected10.toggle();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

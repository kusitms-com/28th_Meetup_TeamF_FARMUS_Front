import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // 텍스트 입력 필드 컨트롤러
  final TextEditingController controller = TextEditingController();
  RxBool hasSpecialCharacters = RxBool(false);
  RxBool hasInput = RxBool(false);

  // 선택 박스 컨트롤러
  final isSelected1 = RxBool(false);
  final isSelected2 = RxBool(false);
  final isSelected3 = RxBool(false);
  final isSelected4 = RxBool(false);
  final isSelected5 = RxBool(false);
  final isSelected6 = RxBool(false);
  final isSelected7 = RxBool(false);
  final isSelected8 = RxBool(false);
  final isSelected9 = RxBool(false);
  final isSelected10 = RxBool(false);
  final isSecond = RxBool(false);

  RxBool hasBoxesSelected = RxBool(false);

  var time = RxInt(0);
  var skill = RxString("");

  final image = Rxn<File>();

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
      // 특수문자를 입력했는지
      if (value.contains(RegExp(r'[!@#<>?":.,_`~;/[\]\\|=+)(*&^%$]'))) {
        hasSpecialCharacters.value = true;
      } else if (value.contains(RegExp(r"['-]"))) {
        hasSpecialCharacters.value = true;
      } else {
        hasSpecialCharacters.value = false;
      }

      if (isSelected1.value || isSelected2.value || isSelected3.value) {
        hasBoxesSelected.value = true;
      } else {
        hasBoxesSelected.value = false;
      }
    });
  }

  void setImageFile(File file) {
    image.value = file;
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
    isSelected4.value = true;
    isSelected5.value = false;
    isSelected6.value = false;
    time.value = 0;
  }

  void selectBox5() {
    isSelected4.value = false;
    isSelected5.value = true;
    isSelected6.value = false;
    time.value = 1;
  }

  void selectBox6() {
    isSelected4.value = false;
    isSelected5.value = false;
    isSelected6.value = true;
    time.value = 2;
  }

  void selectBox7() {
    isSelected7.value = true;
    isSelected8.value = false;
    isSelected9.value = false;
    isSelected10.value = false;
    skill.value = "입문자";
  }

  void selectBox8() {
    isSelected7.value = false;
    isSelected8.value = true;
    isSelected9.value = false;
    isSelected10.value = false;
    skill.value = "초보자";
  }

  void selectBox9() {
    isSelected7.value = false;
    isSelected8.value = false;
    isSelected9.value = true;
    isSelected10.value = false;
    skill.value = "중급자";
  }

  void selectBox10() {
    isSelected7.value = false;
    isSelected8.value = false;
    isSelected9.value = false;
    isSelected10.value = true;
    skill.value = "고수";
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FarmclubController extends GetxController {
  final TextEditingController controller = TextEditingController();
  RxBool hasSpecialCharacters = RxBool(false);
  RxBool hasInput = RxBool(false);

  RxBool isSelectLike = RxBool(false);
  RxInt like = 2.obs; // 초기 좋아요 수

  RxBool isCheck = RxBool(false);
  RxBool shouldExit = RxBool(false);

  RxBool isTextBox1Selected = RxBool(false);
  RxBool isTextBox2Selected = RxBool(false);

  RxInt selectedTextBoxIndex = RxInt(0);

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
    });
  }

  void toggleSelectCheck() {
    isCheck.value = !isCheck.value;
  }

  void toggleSelectTextBox(int index) {
    // 이미 선택된 텍스트 박스를 다시 선택하는 경우 무시
    if (index == selectedTextBoxIndex.value) return;

    // 선택된 텍스트 박스의 인덱스 갱신
    selectedTextBoxIndex.value = index;

    // 선택된 텍스트 박스에 따라 shouldExit 및 배경 색상 업데이트
    toggleShouldExit();
  }

  // shouldExit 값 및 배경 색상을 업데이트하는 메서드
  void toggleShouldExit() {
    shouldExit.value = isCheck.value;

    // 선택된 텍스트 박스에 따라 배경 색상 업데이트
    isTextBox1Selected.value = selectedTextBoxIndex.value == 0;
    isTextBox2Selected.value = selectedTextBoxIndex.value == 1;
  }
}

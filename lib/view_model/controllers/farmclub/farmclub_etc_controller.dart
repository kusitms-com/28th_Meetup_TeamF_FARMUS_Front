import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';

class FarmclubEtcController extends GetxController {
  final TextEditingController controller = TextEditingController();
  RxBool hasInput = RxBool(false);

  RxBool isCheck = RxBool(false);
  RxBool isCategory = RxBool(false);
  RxBool shouldExit = RxBool(false);

  RxBool isTextBox1Selected = RxBool(false);
  RxBool isTextBox2Selected = RxBool(false);

  RxInt selectedTextBoxIndex = RxInt(0);

  RxList<FarmclubInfoModel> farmclubList = <FarmclubInfoModel>[].obs;

  var isCombinedWidgetVisible = true.obs;

  String enteredText = '';
  RxList<String> difficulties = <String>[].obs;
  RxString selectedStatus = "".obs;
  RxString selectedKeyword = "".obs;

  // 선택한 카테고리 정보 저장
  RxString selectedCategory = "".obs;

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

  void toggleSelectCategory() {
    isCategory.value = !isCategory.value;
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

  void updateEnteredText(String text) {
    enteredText = text;
  }

  // 선택한 카테고리 업데이트 메서드
  void updateSelectedCategory(String category) {
    selectedCategory.value = category;
  }

  // difficulties 업데이트 메서드
  void updateDifficulties(List<String> updatedDifficulties) {
    difficulties.assignAll(updatedDifficulties);
  }

  // status 업데이트 메서드
  void updateStatus(String updatedStatus) {
    selectedStatus.value = updatedStatus;
  }
}

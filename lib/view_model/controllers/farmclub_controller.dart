import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/data/network/farmclub_api_service.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';

class FarmclubController extends GetxController {
  final TextEditingController controller = TextEditingController();
  RxBool hasInput = RxBool(false);

  RxBool isSelectLike = RxBool(false);
  RxInt like = 2.obs; // 초기 좋아요 수

  RxBool isCheck = RxBool(false);
  RxBool isCategory = RxBool(false);
  RxBool shouldExit = RxBool(false);

  RxBool isTextBox1Selected = RxBool(false);
  RxBool isTextBox2Selected = RxBool(false);

  RxInt selectedTextBoxIndex = RxInt(0);

  final contentValue = "".obs;
  final image = Rxn<File>();
  final isFormVaild = RxBool(false);

  var isCombinedWidgetVisible = true.obs;
  String enteredText = '';
  FarmclubApiService _farmclubApiService = FarmclubApiService();
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

    ever(contentValue, (_) {
      checkFormVaildity();
    });

    ever(image, (_) => checkFormVaildity());
  }

  void updateContentValue(String value) {
    contentValue.value = value;
  }

  void setImageFile(File file) {
    image.value = file;
  }

  void checkFormVaildity() {
    isFormVaild.value = contentValue.isNotEmpty && image.value != null;
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
    isCombinedWidgetVisible.value = false;
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

  // keyword 업데이트 메서드
  void updateKeyword(String updatedKeyword) {
    selectedKeyword.value = updatedKeyword;
  }

  // API 요청 메서드
  Future<void> getFarmclubData(
    List<String> difficulties,
    String status,
    String keyword,
  ) async {
    try {
      // FarmclubApiService의 메서드를 활용하여 데이터를 가져온다.
      final List<FarmclubInfoModel> farmclubList =
          await _farmclubApiService.getFarmclub(
        difficulties: difficulties,
        status: selectedStatus.value,
        keyword: selectedKeyword.value,
      );

      // 가져온 데이터를 처리하는 로직 추가
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
    }
  }

  // 검색 버튼이 눌렸을 때 실행되는 메서드
  void onSearchButtonPressed() {
    // FarmclubController의 메서드를 호출하여 API 요청
    getFarmclubData(["Easy"], "준비 중", "바밧");
  }
}

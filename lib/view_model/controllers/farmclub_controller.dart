import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';
import 'package:mojacknong_android/repository/farmclub_repository.dart';

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

  // 선택한 키워드 업데이트 메서드
  void updateSelectedKeyword(String keyword) {
    selectedKeyword.value = keyword;
  }

  void updateCombinedWidgetVisible(String keyword) {
    isCombinedWidgetVisible.value = false;
  }

  Future<List<FarmclubInfoModel>> getFarmclubData(
    List<String> difficulties,
    String status,
    String keyword,
  ) async {
    try {
      print("zzcz");
      List<FarmclubInfoModel> responseData =
          await FarmclubRepository.getFarmclub(
        difficulties,
        status,
        selectedKeyword.value,
      );

      // RxList 갱신
      farmclubList.clear();
      farmclubList.addAll(responseData);

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }

  Future<void> onSearchButtonPressed() async {
    // FarmclubController의 메서드를 호출하여 API 요청
    try {
      // selectedStatus의 값이 비어있으면 "All"로 설정
      final status =
          selectedStatus.value.isNotEmpty ? selectedStatus.value : "All";

      // FarmclubApiService의 getFarmclub 호출
      final data = await getFarmclubData(
        difficulties,
        status,
        selectedKeyword.value,
      );

      // 출력
      for (FarmclubInfoModel infoModel in farmclubList) {
        print("Challenge ID: ${infoModel.challengeId}");
        print("Veggie Name: ${infoModel.veggieName}");
        print("Challenge Name: ${infoModel.challengeName}");
        print("Image: ${infoModel.image}");
        print("Difficulty: ${infoModel.difficulty}");
        print("Max User: ${infoModel.maxUser}");
        print("Current User: ${infoModel.currentUser}");
        print("Status: ${infoModel.status}");
        print("--------------------");
      }

      print('팜클럽 데이터 $data');
    } catch (error) {
      // 에러 처리 로직 추가
      print('Error in onSearchButtonPressed: $error');
    }
  }
}

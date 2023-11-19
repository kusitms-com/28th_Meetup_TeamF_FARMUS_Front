import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';
import 'package:mojacknong_android/repository/farmclub_repository.dart';

class FarmclubSearchController extends GetxController {
  final TextEditingController controller = TextEditingController();
  RxBool hasInput = RxBool(false);
  final contentValue = "".obs;

  RxList<FarmclubInfoModel> farmclubList = <FarmclubInfoModel>[].obs;

  var isCombinedWidgetVisible = true.obs;

  String enteredText = '';
  RxList<String> difficulties = <String>[].obs;
  RxString selectedStatus = "".obs;
  RxString selectedKeyword = "".obs;
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

  void updateSelectedKeyword(String keyword) {
    selectedKeyword.value = keyword;
  }

  void updateCombinedWidgetVisible(String keyword) {
    isCombinedWidgetVisible.value = false;
  }

  void updateKeyword(String updatedKeyword) {
    selectedKeyword.value = updatedKeyword;
  }

  Future<List<FarmclubInfoModel>> getFarmclubData(
    List<String> difficulties,
    String status,
    String keyword,
  ) async {
    try {
      List<FarmclubInfoModel> responseData =
          await FarmclubRepository.postFarmclub(
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

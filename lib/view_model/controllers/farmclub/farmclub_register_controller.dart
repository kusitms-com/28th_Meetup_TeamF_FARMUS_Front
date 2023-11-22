import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/data/network/farmclub_api_service.dart';

import 'package:get/get.dart';

import '../../../model/veggie_registration.dart';
import '../../../repository/farmclub_repository.dart';

class FarmclubRegisterController extends GetxController {
  // 선택된 채소들의 상태를 저장하는 변수
  RxList<bool> isSelectedList = List.generate(6, (index) => false).obs;
  RxInt selectedVeggieIndex = RxInt(-1);
  RxBool isLoading = RxBool(true);
  RxList<VeggieRegistration> veggieRegistration = <VeggieRegistration>[].obs;

  RxBool isMemberValid = RxBool(true);
  final RegExp _numberRegExp = RegExp(r'^[3-9]$|^1[0-9]$|^20$');

  RxBool isCheck = RxBool(false);

  RxMap veggieData = {}.obs;
  RxMap veggieLevel = {}.obs;

  final TextEditingController controller = TextEditingController();
  RxBool hasInput = RxBool(false);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController memberController = TextEditingController();
  final TextEditingController introController = TextEditingController();

  final titleValue = "".obs;
  final memberValue = "".obs;
  final contentValue = "".obs;

  RxBool hasNameInput = RxBool(false);
  RxBool hasMemberInput = RxBool(false);
  RxBool hasIntroInput = RxBool(false);

  RxBool isFormValid = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    initHasText();

    ever(isCheck, (_) {
      checkFormVaildity();
    });

    ever(titleValue, (_) {
      checkFormVaildity();
    });

    ever(memberValue, (_) {
      checkFormVaildity();
    });

    ever(contentValue, (_) {
      checkFormVaildity();
    });

    ever(selectedVeggieIndex, (_) {
      checkFormVaildity();
    });

    // UI 초기화 로직 분리
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      initializeVeggieData();
      initializeVeggieLevel();
      isLoading.value = false; // 초기화가 끝나면 로딩 상태 해제
    });
  }

  // 선택된 채소의 인덱스를 업데이트하는 메서드
  void updateSelectedVeggieIndex(int index) {
    selectedVeggieIndex.value = index;
  }

  void initHasText() {
    nameController.addListener(() {
      hasNameInput.value = nameController.text.isNotEmpty;
      update();
    });

    memberController.addListener(() {
      hasMemberInput.value = memberController.text.isNotEmpty;
      update();
    });

    introController.addListener(() {
      hasIntroInput.value = introController.text.isNotEmpty;
      update();
    });
  }

  void toggleImageSelection(int index) {
    if (isSelectedList[index]) {
      // 이미 선택된 아이템을 선택하면 선택 해제
      isSelectedList[index] = false;
      updateSelectedVeggieIndex(-1);
      print(index);
    } else {
      // 선택되지 않은 아이템을 선택하면 반전
      for (int i = 0; i < isSelectedList.length; i++) {
        isSelectedList[i] = i == index;
      }
      updateSelectedVeggieIndex(index);
    }

    print("1. 채소 선택 ${selectedVeggieIndex}");
    update(); // 상태 업데이트
  }

  // 채소 데이터를 초기화하는 메서드
  void initializeVeggieData() {
    veggieData.addAll({
      'lettuce': '상추',
      'greenonion': '대파',
      'basil': '바질',
      'sesame': '깻잎',
      'pepper': '고추',
      'tomato': '토마토',
    });
  }

  // 난이도 데이터를 초기화하는 메서드
  void initializeVeggieLevel() {
    veggieLevel.addAll({
      'lettuce': 'Easy',
      'greenonion': 'Easy',
      'basil': 'Normal',
      'sesame': 'Normal',
      'pepper': 'Hard',
      'tomato': 'Hard',
    });
  }

  void toggleSelectCheck() {
    isCheck.value = !isCheck.value;
    print("2. 채소 선택 ${isCheck}");
  }

  void updateTitleValue(String value) {
    titleValue.value = value;
    print("3. 팜클럽 이름 ${titleValue}");
  }

  void updateMemberValue(String value) {
    memberValue.value = value;
    print("4. 멤버 ${memberValue}");
  }

  void updateContentValue(String value) {
    contentValue.value = value;
    print("5. 한줄소개 ${contentValue}");
  }

  void checkMemberValidity() {
    isMemberValid.value = _numberRegExp.hasMatch(memberValue.value);
  }

  void checkFormVaildity() {
    isFormValid.value = contentValue.isNotEmpty &&
        titleValue.isNotEmpty &&
        memberValue.isNotEmpty &&
        selectedVeggieIndex.value != -1;
  }

  Future<List<VeggieRegistration>> getVeggieRegistration() async {
    try {
      List<VeggieRegistration> responseData =
      await FarmclubRepository.getVeggieRegistration();

      // RxList 갱신
      veggieRegistration.clear();
      veggieRegistration.addAll(responseData);

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }

  Future<int> postNewFarmclub() async {
    print(selectedVeggieIndex.toString());
    print(titleValue.toString());
    print(memberValue.toString());
    print(contentValue.toString());
    try {
      int responseData = await FarmclubRepository.postNewFarmclub(
        selectedVeggieIndex.toString(),
        "65550000f986782347487451",
        titleValue.toString(),
        memberValue.toString(),
        contentValue.toString(),
      );

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }
}
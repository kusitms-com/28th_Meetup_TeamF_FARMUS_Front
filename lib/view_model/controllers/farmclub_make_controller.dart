import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FarmclubMakeController extends GetxController {
  // 선택된 채소들의 상태를 저장하는 변수
  RxList<bool> isSelectedList = List.generate(6, (index) => false).obs;
  RxInt selectedVeggieIndex = RxInt(-1);

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

  final isFormVaild = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    initHasText();
    initializeVeggieData();
    initializeVeggieLevel();

    ever(titleValue, (_) {
      checkFormVaildity();
    });

    ever(memberValue, (_) {
      checkFormVaildity();
    });

    ever(contentValue, (_) {
      checkFormVaildity();
    });
  }

  // 선택된 채소의 인덱스를 업데이트하는 메서드
  void updateSelectedVeggieIndex(int index) {
    selectedVeggieIndex.value = index;
    checkFormVaildity(); // 선택된 채소가 변경될 때마다 폼 유효성을 다시 확인
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

  // 선택된 이미지의 상태를 토글하고 다른 선택 상태를 해제하는 메서드
  void toggleImageSelection(int index) {
    for (int i = 0; i < isSelectedList.length; i++) {
      if (i == index) {
        // 현재 선택한 아이템이면 반전
        isSelectedList[i] = !isSelectedList[i];
      } else {
        // 다른 아이템은 선택 해제
        isSelectedList[i] = false;
      }
    }
    print(index);
    updateSelectedVeggieIndex(index);
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

  void updateTitleValue(String value) {
    titleValue.value = value;
  }

  void updateMemberValue(String value) {
    memberValue.value = value;
  }

  void updateContentValue(String value) {
    contentValue.value = value;
  }

  void checkFormVaildity() {
    selectedVeggieIndex.value != null;
    update(); // 추가: 상태 업데이트
  }
}

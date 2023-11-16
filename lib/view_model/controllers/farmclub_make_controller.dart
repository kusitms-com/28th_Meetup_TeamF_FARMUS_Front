import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FarmclubMakeController extends GetxController {
  // 선택된 채소들의 상태를 저장하는 변수
  RxList<bool> isSelectedList = List.generate(6, (index) => false).obs;

  RxMap veggieData = {}.obs;
  RxMap veggieLevel = {}.obs;

  final TextEditingController controller = TextEditingController();
  RxBool hasInput = RxBool(false);

  final contentValue = "".obs;

  @override
  void onInit() {
    super.onInit();
    initHasText();
    initializeVeggieData();
    initializeVeggieLevel();
  }

  void initHasText() {
    // 텍스트 필드의 값이 변경될 때 호출되는 함수
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

  void updateContentValue(String value) {
    contentValue.value = value;
  }
}

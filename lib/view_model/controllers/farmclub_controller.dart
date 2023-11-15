import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FarmclubController extends GetxController {
  final TextEditingController controller = TextEditingController();
  RxBool hasSpecialCharacters = RxBool(false);
  RxBool hasInput = RxBool(false);

  RxBool isSelectLike = RxBool(false);
  RxInt like = 2.obs; // 초기 좋아요 수

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
}

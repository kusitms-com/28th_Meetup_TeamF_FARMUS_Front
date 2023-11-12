import 'dart:io';

import 'package:get/get.dart';

class CommunityPostController extends GetxController {
  // 제목, 내용 작성
  final titleValue = "".obs;
  final contentValue = "".obs;
  final image = Rxn<File>();

  // 카테고리 선택
  final isSelected1 = RxBool(false);
  final isSelected2 = RxBool(false);
  final isSelected3 = RxBool(false);

  var selectedCategory = "".obs;

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void updateTitleValue(String value) {
    titleValue.value = value;
  }

  void updateContentValue(String value) {
    contentValue.value = value;
  }

  void setImageFile(File file) {
    image.value = file;
  }

  void selectCategory1() {
    isSelected1.value = true;
    isSelected2.value = false;
    isSelected3.value = false;
  }

  void selectCategory2() {
    isSelected1.value = false;
    isSelected2.value = true;
    isSelected3.value = false;
  }

  void selectCategory3() {
    isSelected1.value = false;
    isSelected2.value = false;
    isSelected3.value = true;
  }
}

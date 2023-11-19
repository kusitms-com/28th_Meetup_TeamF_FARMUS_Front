import 'dart:io';

import 'package:get/get.dart';

class DiaryPostController extends GetxController {
  // 제목, 내용 작성
  // final titleValue = "".obs;
  final contentValue = "".obs;
  final image = Rxn<File>();

  var selectedCategory = "".obs;

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  // void updateTitleValue(String value) {
  //   titleValue.value = value;
  // }

  void updateContentValue(String value) {
    contentValue.value = value;
  }

  void setImageFile(File file) {
    image.value = file;
  }
}

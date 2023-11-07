import 'dart:io';

import 'package:get/get.dart';

class CommunityPostController extends GetxController {
  final titleValue = "".obs;
  final contentValue = "".obs;
  final image = Rxn<File>();

  void updateTitleValue(String value) {
    titleValue.value = value;
  }

  void updateContentValue(String value) {
    contentValue.value = value;
  }

  void setImageFile(File file) {
    image.value = file;
  }
}

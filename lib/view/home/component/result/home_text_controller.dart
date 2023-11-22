import 'dart:io';

import 'package:get/get.dart';

class HomeTextController extends GetxController {
  final contentValue = "".obs;
  final image = Rxn<File>();

  void updateContentValue(String value) {
    contentValue.value = value;
  }

  void setImageFile(File file) {
    image.value = file;
  }
}

import 'package:get/get.dart';

class CommunityDetailController extends GetxController {
  final textValue = "".obs;

  void updateTextValue(String value) {
    textValue.value = value;
  }

  void clearTextValue() {
    textValue.value = "";
  }
}

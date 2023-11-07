import 'package:get/get.dart';

class CommunityDetailController extends GetxController {
  final textValue = "".obs;

  final titleValue = "".obs;
  final contentValue = "".obs;

  void updateTextValue(String value) {
    textValue.value = value;
  }

  void updateTitleValue(String value) {
    titleValue.value = value;
  }

  void updateContentValue(String value) {
    contentValue.value = value;
  }
}

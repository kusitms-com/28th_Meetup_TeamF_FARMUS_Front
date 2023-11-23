


import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DiaryController extends GetxController {

  final userNickname = "".obs;
  final nickname = "".obs;
  final image = "".obs;
  final vegeId = RxInt(0);
  final age = RxInt(0);






  void updateUserNicknameValue(String value) {
    userNickname.value = value;
    print("get: " +userNickname.value);
  }

  void updateVegeIdValue(int value) {
    vegeId.value = value;
    print(vegeId.value);
  }

  void updateNicknameValue(String value) {
    nickname.value = value;
    print("get: " +nickname.value);
  }

  void updateImageValue(String value) {
    image.value = value;
    print("get: " +image.value);
  }

  void updateAgeValue(int value) {
    age.value = value;
    print(age.value);
  }





}

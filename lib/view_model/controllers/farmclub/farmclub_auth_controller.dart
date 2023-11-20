import 'dart:io';

import 'package:get/get.dart';

import '../../../repository/farmclub_repository.dart';

class FarmclubAuthController extends GetxController {
  final contentValue = "".obs;
  final image = Rxn<File>();
  final isFormVaild = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    ever(contentValue, (_) {
      checkFormVaildity();
    });

    ever(image, (_) => checkFormVaildity());
  }

  void updateContentValue(String value) {
    contentValue.value = value;
  }

  void setImageFile(File file) {
    image.value = file;
  }

  void checkFormVaildity() {
    isFormVaild.value = contentValue.isNotEmpty && image.value != null;
  }


  // 나의 팜클럽 조회
  void postFarmclubMission(String registrationId, String content, File image) async {
    try {
      String response = await FarmclubRepository.postFarmclubMission(registrationId, content, image);

      print(response);
    } catch (e) {
      print("오류: $e");
    }
  }

}

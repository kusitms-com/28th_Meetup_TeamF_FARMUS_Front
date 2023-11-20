import 'dart:io';

import 'package:get/get.dart';

import '../../../model/farmclub_mission_response.dart';
import '../../../repository/farmclub_repository.dart';

class FarmclubAuthController extends GetxController {
  RxInt registrationId = 0.obs;
  final contentValue = "".obs;
  final image = Rxn<File>();
  final isFormValid = RxBool(false);
  Rx<FarmclubMissionData?> farmclubMission = Rx<FarmclubMissionData?>(null);



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
    isFormValid.value = contentValue.isNotEmpty && image.value != null;
  }


  void postFarmclubMission(int registrationId, String content, File image) async {
    try {
      FarmclubMissionResponse response = await FarmclubRepository.postFarmclubMission(registrationId, content, image);

      print("꺅갹 ${response.data.step}");

      farmclubMission.value = response.data;

    } catch (e) {
      print("오류: $e");
    }
  }

}

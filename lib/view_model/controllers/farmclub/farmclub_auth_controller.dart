import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_complete.dart';
import 'package:mojacknong_android/common/bottom_sheet/farmclub_finish_final.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

import '../../../common/dialog/dialog_mission_farmclub.dart';
import '../../../model/farmclub_mission_response.dart';
import '../../../repository/farmclub_repository.dart';

class FarmclubAuthController extends GetxController {
  RxInt registrationId = 0.obs;
  final contentValue = "".obs;
  final image = Rxn<File>();
  final isFormValid = RxBool(false);
  Rx<FarmclubMissionData?> farmclubMission = Rx<FarmclubMissionData?>(null);
  RxBool missionUploaded = RxBool(false);
  RxBool isLoading = RxBool(false); // 추가: 로딩 상태를 표시하는 변수
  BottomSheetController controller = BottomSheetController();
  Rx<FarmclubComplete?> farmclubComplete = Rx<FarmclubComplete?>(null);

  @override
  void onInit() {
    super.onInit();

    ever(contentValue, (_) {
      checkFormValidity();
    });

    ever(image, (_) => checkFormValidity());
  }

  void updateContentValue(String value) {
    contentValue.value = value;
  }

  void setImageFile(File file) {
    image.value = file;
  }

  void checkFormValidity() {
    isFormValid.value = contentValue.isNotEmpty && image.value != null;
  }


  Future<void> postFarmclubMission(
      BuildContext context,
      int registrationId, String content, File image) async {
    try {
      isLoading.value = true;

      FarmclubMissionResponse response =
      await FarmclubRepository.postFarmclubMission(
          registrationId, content, image);

      farmclubMission.value = response.data;
      missionUploaded.value = true;

      if (farmclubMission.value!.isEnd == true) {
        deleteFarmclubComplete(context);
      }

    } catch (e) {
      print("오류: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteFarmclubComplete(BuildContext context) async {
    try {
      print(registrationId);
      FarmclubComplete? farmclubCompleteData =
          await FarmclubRepository.deleteFarmclubComplete(
              farmclubMission.value!.registrationId.toString());
      farmclubComplete.refresh();
      farmclubComplete.value = farmclubCompleteData;
      print(farmclubComplete.value!.challengeName.toString());
      controller.showMissionFinishDialog(context, farmclubComplete.value!.challengeName);
    } catch (e) {
      print("오류: $e");
    }
  }
}

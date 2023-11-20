import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

import '../../../common/dialog/dialog_join_farmclub.dart';
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

  void postFarmclubMission(
      int registrationId, String content, File image) async {
    try {
      isLoading.value = true; // 업로드 시작 시 로딩 상태 표시

      FarmclubMissionResponse response =
          await FarmclubRepository.postFarmclubMission(
              registrationId, content, image);

      print("꺅갹 $response");

      farmclubMission.value = response.data;
      missionUploaded.value = true; // 미션 업로드 성공 표시

    } catch (e) {
      print("오류: $e");
    } finally {
      isLoading.value = false; // 업로드 종료 시 로딩 상태 종료
    }
  }
}

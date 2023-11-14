import 'dart:io';

import 'package:get/get.dart';
import 'package:mojacknong_android/data/network/onboarding_api_service.dart';

class UserViewModel extends GetxController {
  final OnboardingApiService _apiService;

  UserViewModel(this._apiService);

  RxBool isDataFetching = false.obs;

  // 닉네임을 저장할 Rx 변수
  RxString nickName = "".obs;

  // 온보딩 API를 호출하여 닉네임 설정하기
  Future<void> setNickName(String nickname) async {
    try {
      // 닉네임을 설정하는 API 호출
      await _apiService.postNickName(nickname);

      // Rx 변수에 설정한 닉네임 저장
      nickName.value = nickname;
      print(nickname);
    } catch (e) {
      // 오류 처리
      print("에러: $e");
    }
  }

  Future<void> setProfileData(File? imageFile, String nickname) async {
    try {
      await _apiService.postUserData(imageFile, nickname);
      nickName.value = nickname;
    } catch (e) {
      print("에러: $e");
    }
  }
}

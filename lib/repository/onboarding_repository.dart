import 'dart:io';

import 'package:mojacknong_android/data/network/onboarding_api_service.dart';

class OnboardingRepository {
  static Future<String> getProfileImageApi() async {
    String response = await OnboardingApiService().getProfileImage();
    print("프로필이미지 $response");
    return response;
  }

  static Future<String> postProfileApi(File? imageFile, String nickname) async {
    String response = "false";
    if (imageFile != null) {
      response = await OnboardingApiService().postUserData(imageFile, nickname);
    }
    print("프로필 이미지 보내기 $response");
    return response;
  }
}

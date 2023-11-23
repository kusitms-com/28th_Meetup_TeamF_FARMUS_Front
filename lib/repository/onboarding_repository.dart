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
    print("프로필 $imageFile");
    if (imageFile != null) {
      response = await OnboardingApiService().postUserData(imageFile, nickname);
      print("프로필 이미지 보내기 $response");
    } else {
      response = await OnboardingApiService().postNickName(nickname);
      print("프로필 이미지 보내기^^^^ $response");
    }
    return response;
  }

  static Future<String> postMotivation(List<String> motivation) async {
    String response = await OnboardingApiService().postMotivation(motivation);
    return response;
  }

  static Future<String> postLevel(int time, String skill) async {
    print("$time, $skill");
    String response = await OnboardingApiService().postLevel(time, skill);
    return response;
  }

  static Future<String> patchComplete() async {
    String response = await OnboardingApiService().patchComplete();
    return response;
  }

  static Future<String> patchUserProfileDelete() async {
    String response = await OnboardingApiService().patchComplete();
    return response;
  }


  static Future<String> postCropHistory() async {
    String response = await OnboardingApiService().postCropHistory();
    print("팜히스토리 생성 $response");
    return response;
  }
}

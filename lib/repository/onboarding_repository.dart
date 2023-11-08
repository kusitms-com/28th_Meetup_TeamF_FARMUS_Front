import 'package:mojacknong_android/data/network/onboarding_api_service.dart';

class OnboardingRepository {
  static Future<String> profileImageApi() async {
    String response = await OnboardingApiService().getProfileImage();
    print("프로필이미지 $response");
    return response;
  }
}

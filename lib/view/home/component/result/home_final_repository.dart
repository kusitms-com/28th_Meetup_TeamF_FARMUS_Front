import 'package:mojacknong_android/data/network/onboarding_api_service.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_api_service.dart';

class HomeFinalRepository {
  static Future<String> postDone(List<String> motivation) async {
    String response = await HomeFinalApiService().postDone(motivation);
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

  // static Future<String> postCropHistory() async {
  //   String response = await OnboardingApiService().postCropHistory();
  //   print("팜히스토리 생성 $response");
  //   return response;
  // }
}

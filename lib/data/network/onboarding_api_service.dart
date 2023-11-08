import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';

const storage = FlutterSecureStorage();

class OnboardingApiService {
  Future<String> getProfileImage() async {
    try {
      Response response = await ApiClient().dio.get('/api/user/profileImage');
      print(response.data);
      String profileImage = response.data["data"]["profileImage"];
      return profileImage;
    } on DioError catch (e) {
      print(e.message);
      print("온보딩실패");
      return "false";
    }
  }
}

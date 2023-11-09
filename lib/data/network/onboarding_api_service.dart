import 'dart:io';

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
    } on DioException catch (e) {
      print(e.message);
      print("온보딩실패");
      return "false";
    }
  }

  Future<String> postUserData(File? imageFile, String nickname) async {
    try {
      print(imageFile);
      FormData formData = FormData.fromMap({
        'file': imageFile != null
            ? await MultipartFile.fromFile(imageFile.path,
                filename: imageFile.path.split('/').last)
            : null,
        'nickName': nickname,
      });

      Response response = await ApiClient().dio.post(
            '/api/user/select-information',
            data: formData,
          );

      print(response.data);
      return "";
    } on DioException catch (e) {
      print(e.message);
      return "false";
    }
  }
}

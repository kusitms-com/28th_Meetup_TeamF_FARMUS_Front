import 'dart:convert';
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
      print("이미지이미지 $imageFile");
      FormData formData;

      if (imageFile != null) {
        formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(imageFile.path,
              filename: imageFile.path.split('/').last),
          'nickName': nickname,
        });
      } else {
        formData = FormData.fromMap({
          'nickName': nickname,
        });
      }
      print(formData.fields[0]);

      Response response = await ApiClient().dio.post(
            '/api/user/select-information',
            data: formData,
          );

      print(response.data);
      return "성공";
    } on DioException catch (e) {
      print(e.message);
      return "false";
    }
  }

  Future<String> postMotivation(List<String> motivation) async {
    try {
      String motivationData = jsonEncode({"motivation": motivation});
      Response response = await ApiClient()
          .dio
          .post("/api/user/on-boarding/motivation", data: motivationData);
      print(response.data);
      return "성공";
    } on DioException catch (e) {
      print(e.message);
      return "false";
    }
  }

  Future<String> postLevel(int time, String skill) async {
    try {
      final Map<String, dynamic> data = {
        "time": time,
        "skill": skill,
      };

      String jsonData = jsonEncode(data);

      Response response = await ApiClient()
          .dio
          .post("/api/user/on-boarding/level", data: jsonData);
      print(response.data);

      print(response.data["data"]["level"]);
      return "성공";
    } on DioException catch (e) {
      print(e.message);
      return "false";
    }
  }

  Future<String> patchComplete() async {
    try {
      print("object");
      Response response =
          await ApiClient().dio.patch("/api/user/sign-up/complete");
      print(response.data);
      return "성공";
    } on DioException catch (e) {
      print(e.message);
      return "false";
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';

const storage = FlutterSecureStorage();

class HomeFinalApiService {
  Future<String> postFinalData(File? imageFile, String content) async {
    try {
      print("이미지이미지 $imageFile");
      FormData formData;

      if (imageFile != null) {
        formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(imageFile.path,
              filename: imageFile.path.split('/').last),
          'content': content,
        });
      } else {
        formData = FormData.fromMap({
          'file': [],
          'content': content,
        });

        print(formData.fields[0]);
      }

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

  Future<String> postDone(List<String> motivation) async {
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

  Future<String> patchComplete() async {
    try {
      Response response =
          await ApiClient().dio.patch("/api/user/sign-up/complete");
      print(response.data);
      return "성공";
    } on DioException catch (e) {
      print(e.message);
      return "false";
    }
  }

  Future<String> patchUserProfileDelete() async {
    try {
      Response response =
          await ApiClient().dio.patch("/api/user/delete/user-profile");
      print(response.data);
      return "성공";
    } on DioException catch (e) {
      print(e.message);
      return "false";
    }
  }

  Future<String> postCropHistory() async {
    try {
      Response response = await ApiClient().dio.post("/api/crop/history");
      print(response.data);
      return "성공";
    } on DioException catch (e) {
      print(e.message);
      return "false";
    }
  }
}

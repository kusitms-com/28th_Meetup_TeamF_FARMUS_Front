import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';
import 'package:mojacknong_android/model/farmus_user.dart';

const storage = FlutterSecureStorage();


class MypageApiService {
  FutureOr<FarmusUser?> getUser() async {
    try {
      Response response = await ApiClient().dio.get('/api/user');
      print(134);
      print(response.data["data"]);
      if (response.data["data"] != null) {
      //  final userData = response.data["data"];
        final userData = FarmusUser.fromJson(response.data["data"]);

         print(userData);
        return userData;
      }
    } on DioException catch (e) {
      print(e.message);
      print("유저 조회 실패");

    }
    return null;

  }

}

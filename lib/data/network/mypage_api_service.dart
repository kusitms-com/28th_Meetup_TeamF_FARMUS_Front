import 'dart:async';


import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';
import 'package:mojacknong_android/model/farmus_user.dart';

import '../../model/mypage_history.dart';
import '../../model/vege_history_detail.dart';
import '../../view/my_page/history/my_page_vege_history.dart';

const storage = FlutterSecureStorage();


class MypageApiService {

  FutureOr<FarmusUser?> getUser() async {
    try {
      Response response = await ApiClient().dio.get('/api/user');


      if (response.data["data"] != null) {

        final userData = FarmusUser.fromJson(response.data["data"]);

   //      print(userData);
        return userData;
      }
    } on DioException catch (e) {
      print(e.message);
      print("유저 조회 실패");

    }
    return null;
  }

  FutureOr<MypageHistory?> getHistory() async {
    try {
      Response response = await ApiClient().dio.get('/api/crop/history');


      if (response.data["data"] != null) {
        //  final userData = response.data["data"];
        final historyData = MypageHistory.fromJson(response.data["data"]);

    //    print(historyData);
        return historyData;
      }
    } on DioException catch (e) {
      print(e.message);
      print("팜 히스토리 조회 실패");

    }
    return null;
  }


  FutureOr<void> logout() async {
    try {
      await ApiClient().dio.get('/api/crop/history');

    } on DioException catch (e) {
      print(e.message);
      print("로그인 실패");

    }
  }


  FutureOr<void> userDelete() async {
    try {
      await ApiClient().dio.delete('/api/user/delete');

    } on DioException catch (e) {
      print(e.message);
      print("계정 삭제 실패");

    }
  }



  FutureOr<VegeHistoryDetail?> vegeHistoryDetail(String detailId) async {
    try {

      Response response = await ApiClient().dio.get('/api/crop/history/detail/$detailId',

      );

      if (response.data["data"] != null) {

        final vegeHistoryDetailData = VegeHistoryDetail.fromJson(response.data["data"]);

            print(vegeHistoryDetailData);
        return vegeHistoryDetailData;
      }

    } on DioException catch (e) {
      print(e.message);
      print("히스토리 디테일 조회 실패");

    }
    return null;
  }

}



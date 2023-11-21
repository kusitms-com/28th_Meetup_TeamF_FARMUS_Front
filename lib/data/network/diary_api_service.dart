import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../model/my_vege_diary_list.dart';
import '../../model/my_vege_list.dart';

import 'base_api_services.dart';


const storage = FlutterSecureStorage();

class DiaryApiService {


  static Future<MyVegeDiaryList?> getMyVegeDiaryList(int vegeId) async {
    try {

      Response response = await ApiClient().dio.get('/api/veggie/diary/$vegeId');

      if (response.data["data"] != null) {

        final myVegeDiaryListData = MyVegeDiaryList.fromJson(response.data["data"]);

        print(myVegeDiaryListData);

        return myVegeDiaryListData;
      }

    } on DioException catch (e) {
      print(e.message);
      print("내 채소별 일기 조회 실패");

    }
    return null;
  }


}

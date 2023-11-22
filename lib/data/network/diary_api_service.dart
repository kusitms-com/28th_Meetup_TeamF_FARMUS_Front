import 'dart:async';
import 'dart:io';


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


  static FutureOr<void> writeDiary(
      int vegeId,
      String content,
      bool isOpen,
      File diaryImage,
      ) async {
    try {

      FormData formData;
      formData = FormData.fromMap({
        'veggieId': vegeId,
        'content': content,
        'isOpen': isOpen,
        'image': await MultipartFile.fromFile(
          diaryImage.path,
          filename: diaryImage.path.split('/').last,
        ),

      });

      Response response = await ApiClient().dio.post('/api/veggie/diary',data: formData);

      if(response.statusCode == 200){
        print("일기 등록 완료");
        return;
      }

    } on DioException catch (e) {
      print(e.message);
      print("일기 등록 실패");

    }
    return null;
  }


}

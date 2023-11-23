



import 'dart:io';

import '../data/network/diary_api_service.dart';

class DiaryRepository {

  static Future<void> writeDiaryApi(
      int vegeId,
      String content,
      bool isOpen,
      File diaryImage,

      ) async {

    final response = await DiaryApiService.writeDiary(
        vegeId,
        content,
        isOpen,
        diaryImage
    );

    return response;


  }



}
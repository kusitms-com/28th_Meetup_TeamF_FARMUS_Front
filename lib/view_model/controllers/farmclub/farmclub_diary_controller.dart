import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_diary.dart';

import '../../../repository/farmclub_repository.dart';

class FarmclubDiaryController extends GetxController {
  RxList<FarmclubDiary> farmclubDiaryList = <FarmclubDiary>[].obs;

  Future<List<FarmclubDiary>> getFarmclubDiary(
      int challengeId,
      ) async {
    try {
      List<FarmclubDiary> responseData =
      await FarmclubRepository.getFarmclubDiary(
        challengeId,
      );

      // RxList 갱신
      farmclubDiaryList.clear();
      farmclubDiaryList.addAll(responseData);

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }
}
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_mine_detail.dart';

import '../../../model/farmclub_diary.dart';
import '../../../model/farmclub_mine.dart';
import '../../../repository/farmclub_repository.dart';

class FarmclubController extends GetxController {
  // 나의 팜클럽 상태
  RxList<FarmclubMine> myFarmclubState = <FarmclubMine>[].obs;

  RxBool isSelectLike = RxBool(false);
  RxInt like = 0.obs; // 초기 좋아요 수

  RxBool isLoading = true.obs;
  Rx<FarmclubMineDetail?> farmclubInfo = Rx<FarmclubMineDetail?>(null);

  RxInt selectedFarmclubIndex = RxInt(0);
  RxList<FarmclubDiary> farmclubDiaryList = <FarmclubDiary>[].obs;

  @override
  void onInit() {
    super.onInit();

    updateSelectedFarmclub(0);
  }

  void updateSelectedFarmclub(int index) async {
    if (index >= 0 && index < myFarmclubState.length) {
      // 새로운 팜클럽 선택
      selectedFarmclubIndex.refresh();
      selectedFarmclubIndex.value = index;

      print("내 팜클럽 리스트 ${selectedFarmclubIndex.value}");
      getFarmclubDiary(myFarmclubState
          .value[selectedFarmclubIndex.toInt()].challengeId
          .toInt());

      // 새로운 팜클럽 선택 후 화면 업데이트
      getMyFarmclub();
      update();
    }
  }

// 나의 팜클럽 조회
  Future<List<FarmclubMine>> getMyFarmclub() async {
    try {
      isLoading(true);

      List<FarmclubMine>? myFarmclubs = await FarmclubRepository.getFarmclub();
      if (myFarmclubs.isEmpty) {
        print("object");
        isLoading(false);

        return [];
      } else {
        await getFarmclubDetail(
            myFarmclubs[selectedFarmclubIndex.toInt()].challengeId.toString());
        // myFarmclubState 값 변경 후 화면 업데이트
        myFarmclubState.value = myFarmclubs;
        update();

        return myFarmclubs;
      }
    } catch (e) {
      print("나의 팜클럽 조회 중 오류: $e");
      isLoading(false);

      throw e;
    }
  }

  Future<void> getFarmclubDetail(String challengeId) async {
    try {
      isLoading(true);
      FarmclubMineDetail? farmclubData =
          await FarmclubRepository.getFarmclubMineDetail(challengeId);

      farmclubInfo.value = farmclubData;

      isLoading(false);
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error in getFarmclubDetail: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<List<FarmclubDiary>> getFarmclubDiary(
    int challengeId,
  ) async {
    try {
      isLoading(true);

      List<FarmclubDiary> responseData =
          await FarmclubRepository.getFarmclubDiary(
        challengeId,
      );

      // RxList 갱신
      farmclubDiaryList.clear();
      farmclubDiaryList.addAll(responseData);
      print("일기 $farmclubDiaryList");
      isLoading(false);

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      isLoading(false);

      throw error;
    }
  }
}

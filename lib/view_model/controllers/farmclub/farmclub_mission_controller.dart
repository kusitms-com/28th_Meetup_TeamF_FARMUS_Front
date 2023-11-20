import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_mission.dart';
import 'package:mojacknong_android/repository/farmclub_repository.dart';

class FarmclubMissionController extends GetxController {
  RxList<FarmclubMission> farmclubMissionList = <FarmclubMission>[].obs;

  Future<List<FarmclubMission>> getFarmclubRecommend(
    int challengeId,
    int stepNum,
  ) async {
    try {
      List<FarmclubMission> responseData =
          await FarmclubRepository.getFarmclubMission(
        challengeId,
        stepNum,
      );

      // RxList 갱신
      farmclubMissionList.clear();
      farmclubMissionList.addAll(responseData);

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }
}

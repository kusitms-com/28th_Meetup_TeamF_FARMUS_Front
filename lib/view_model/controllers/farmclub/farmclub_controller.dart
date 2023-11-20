import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_mine_detail.dart';

import '../../../model/farmclub_detail.dart';
import '../../../model/farmclub_mine.dart';
import '../../../repository/farmclub_repository.dart';

class FarmclubController extends GetxController {
  // 나의 팜클럽 상태
  var myFarmclubState = <FarmclubMine>[].obs;

  RxBool isSelectLike = RxBool(false);
  RxInt like = 2.obs; // 초기 좋아요 수

  RxBool isLoading = true.obs;
  Rx<FarmclubMineDetail?> farmclubInfo = Rx<FarmclubMineDetail?>(null);

  RxInt selectedFarmclubIndex = RxInt(0);

  void updateSelectedFarmclub(int index) async {
    if (index >= 0 && index < myFarmclubState.length) {
      // 새로운 팜클럽 선택
      selectedFarmclubIndex.value = index;
      selectedFarmclubIndex.refresh();
      getFarmclubDetail(myFarmclubState.value[index].challengeId.toString());
      print(selectedFarmclubIndex.value);
    }
  }

  // 나의 팜클럽 조회
  void getMyFarmclub() async {
    try {
      List<FarmclubMine> myFarmclubs = await FarmclubRepository.getFarmclub();
      getFarmclubDetail(myFarmclubs[0].challengeId.toString());

      myFarmclubState.value = myFarmclubs;
    } catch (e) {
      print("나의 팜클럽 조회 중 오류: $e");
    }
  }

  void getFarmclubDetail(String challengeId) async {
    try {
      isLoading(true);
      FarmclubMineDetail? farmclubData =
          await FarmclubRepository.getFarmclubMineDetail(challengeId);

      farmclubInfo.value = farmclubData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error in getFarmclubDetail: $error');
    } finally {
      isLoading(false);
    }
  }

  void postRegister(String challengeId, String veggieId) async {
    try {
      String response = await FarmclubRepository.postRegister(challengeId, veggieId);
    } catch (error) {
      print('Error in getFarmclubDetail: $error');
    }
  }
}

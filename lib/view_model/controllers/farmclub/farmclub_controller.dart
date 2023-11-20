import 'package:get/get.dart';

import '../../../model/farmclub_detail.dart';
import '../../../model/farmclub_mine.dart';
import '../../../repository/farmclub_repository.dart';

class FarmclubController extends GetxController {
  // 나의 팜클럽 상태
  var myFarmclubState = <FarmclubMine>[].obs;

  RxBool isSelectLike = RxBool(false);
  RxInt like = 2.obs; // 초기 좋아요 수


  RxBool isLoading = true.obs;
  Rx<FarmclubDetail?> farmclubInfo = Rx<FarmclubDetail?>(null);


  RxInt selectedFarmclubIndex = RxInt(0);

  void updateSelectedFarmclub(int index) {
    if (index >= 0 && index < myFarmclubState.length) {
      // 새로운 팜클럽 선택
      selectedFarmclubIndex.value = index;
      selectedFarmclubIndex.refresh();

      print(selectedFarmclubIndex.value);
    }
  }

  // 나의 팜클럽 조회
  void getMyFarmclub() async {
    try {
      List<FarmclubMine> myFarmclubs = await FarmclubRepository.getFarmclub();

      myFarmclubState.value = myFarmclubs;
    } catch (e) {
      print("나의 팜클럽 조회 중 오류: $e");
    }
  }

  void getFarmclubDetail(String challengeId) async {
    try {
      isLoading(true);
      print("1111 $farmclubInfo");
      FarmclubDetail? farmclubData =
      await FarmclubRepository.getFarmclubDetail(challengeId);

      farmclubInfo.value = farmclubData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error in getFarmclubDetail: $error');
    } finally {
      isLoading(false);
    }
  }
}

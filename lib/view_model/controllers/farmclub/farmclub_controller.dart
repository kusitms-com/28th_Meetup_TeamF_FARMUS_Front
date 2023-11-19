import 'package:get/get.dart';

import '../../../model/farmclub_mine.dart';
import '../../../repository/farmclub_repository.dart';

class FarmclubController extends GetxController {
  // 나의 팜클럽 상태
  var myFarmclubState = <FarmclubMine>[].obs;

  RxBool isSelectLike = RxBool(false);
  RxInt like = 2.obs; // 초기 좋아요 수

  // 나의 팜클럽 조회
  void getMyFarmclub() async {
    try {
      List<FarmclubMine> myFarmclubs = await FarmclubRepository.getFarmclub();

      myFarmclubState.value = myFarmclubs;

      print("첫 번째 항목의 challengeId: ${myFarmclubs[0].challengeId}");

      for (FarmclubMine farmclubMine in myFarmclubs) {
        print("이미지 주소: ${farmclubMine.image}");
      }
    } catch (e) {
      print("나의 팜클럽 조회 중 오류: $e");
    }
  }
}

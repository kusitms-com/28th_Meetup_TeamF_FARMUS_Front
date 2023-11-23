import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_detail.dart';
import 'package:mojacknong_android/repository/farmclub_repository.dart';

import '../../../model/veggie_registration.dart';

class FarmclubDetailController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<FarmclubDetail?> farmclubInfo = Rx<FarmclubDetail?>(null);
  RxInt joinChallengeId = 0.obs;

  Future<void> getFarmclubDetail(String challengeId) async {
    try {
      isLoading(true);
      FarmclubDetail? farmclubData =
          await FarmclubRepository.getFarmclubDetail(challengeId);

      farmclubInfo.value = farmclubData;
      joinChallengeId.value = farmclubInfo.value!.challengeId.toInt();
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error in getFarmclubDetail: $error');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    // 컨트롤러가 소멸될 때 호출되는 메서드
    super.onClose();
  }
}

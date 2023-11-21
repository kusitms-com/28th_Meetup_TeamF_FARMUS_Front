import 'package:get/get.dart';
import 'package:mojacknong_android/model/veggie_registration.dart';
import 'package:mojacknong_android/repository/farmclub_repository.dart';

class FarmclubJoinController extends GetxController {
  RxBool isCheck = RxBool(false);
  RxBool isFormValid = RxBool(false);
  RxList<VeggieRegistration> veggieRegistration = <VeggieRegistration>[].obs;

  @override
  void onInit() {
    super.onInit();

    ever(isCheck, (_) {
      checkFormVaildity();
    });
  }

  Future<List<VeggieRegistration>> getVeggieRegistration() async {
    try {
      List<VeggieRegistration> responseData =
          await FarmclubRepository.getVeggieRegistration();

      // RxList 갱신
      veggieRegistration.clear();
      veggieRegistration.addAll(responseData);

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }

  void toggleSelectCheck() {
    isCheck.value = !isCheck.value;
  }

  void checkFormVaildity() {
    isFormValid.value = isCheck.value;
  }
}

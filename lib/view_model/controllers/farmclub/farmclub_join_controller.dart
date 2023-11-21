import 'package:get/get.dart';
import 'package:mojacknong_android/model/veggie_registration.dart';
import 'package:mojacknong_android/repository/farmclub_repository.dart';

class FarmclubJoinController extends GetxController {
  RxBool isCheck = RxBool(false);
  RxBool isFormValid = RxBool(false);
  RxList<VeggieRegistration> veggieRegistration = <VeggieRegistration>[].obs;
  var veggieList = <VeggieRegistration>[].obs;
  RxInt selectedVeggieIndex = RxInt(0);


  @override
  void onInit() {
    super.onInit();

    ever(isCheck, (_) {
      checkFormVaildity();
    });
  }

  void updateSelectedVeggie(int index) async {
    if (index >= 0 && index < veggieList.length) {
      // 새로운 팜클럽 선택
      selectedVeggieIndex.refresh();
      selectedVeggieIndex.value = index;

      print("채소 ${selectedVeggieIndex.value}");

      update();
    }
  }

  Future<List<VeggieRegistration>> getVeggieRegistration() async {
    try {
      List<VeggieRegistration> responseData =
          await FarmclubRepository.getVeggieRegistration();

      // RxList 갱신
      veggieRegistration.clear();
      veggieRegistration.addAll(responseData);
      veggieList.value = responseData;

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }

  Future<String> postFarmclubRegister() async {
    try {
      String responseData =
      await FarmclubRepository.postRegister("1", veggieList[selectedVeggieIndex.toInt()].veggieId.toString());

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

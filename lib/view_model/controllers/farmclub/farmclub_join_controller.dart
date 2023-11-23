import 'package:get/get.dart';
import 'package:mojacknong_android/model/veggie_registration.dart';
import 'package:mojacknong_android/repository/farmclub_repository.dart';

class FarmclubJoinController extends GetxController {
  RxBool isCheck = RxBool(false);
  RxBool isFormValid = RxBool(false);
  RxList<VeggieRegistration> veggieRegistration = <VeggieRegistration>[].obs;
  var veggieList = <VeggieRegistration>[].obs;
  RxList<int> veggieSelected = <int>[].obs;
  RxInt selectedVeggieIndex = RxInt(0);
  RxInt challengeId = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    veggieSelected.assignAll(List<int>.filled(veggieList.length, 0));

    ever(isCheck, (_) {
      checkFormValidity();
    });
  }

  Future<List<VeggieRegistration>> getVeggieRegistration(String veggieInfoId) async {
    veggieSelected.assignAll(List<int>.filled(veggieList.length, 0));

    try {

      print("선택 채소 아이디 $veggieInfoId");
      isCheck.value = false;
      isFormValid.value = false;


      List<VeggieRegistration> responseData =
      await FarmclubRepository.getVeggieRegistration(veggieInfoId);


      // RxList 갱신
      veggieRegistration.clear();
      veggieRegistration.addAll(responseData);
      veggieList.value = responseData;
      veggieSelected.assignAll(List<int>.filled(veggieList.length, 0));

      isFormValid = RxBool(false);

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }

  Future<int> postFarmclubRegister() async {
    try {
      print("채소 아이디 ${veggieList[selectedVeggieIndex.toInt()].veggieId.toString()}");

      int responseData = await FarmclubRepository.postRegister(

         challengeId.toString(), veggieList[selectedVeggieIndex.toInt()].veggieId.toString());
      print("채소 아이디 ${veggieList[selectedVeggieIndex.toInt()].veggieId.toString()}");
      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }

  void toggleSelectCheck(int index) {
    print("가입할 팜클럽 아이디 $challengeId");
    // 이미 선택한 채소를 다시 선택한 경우 선택 해제
    if (veggieSelected[index] == 1) {
      veggieSelected[index] = 0;
      veggieSelected.assignAll(List<int>.filled(veggieList.length, 0));

      isCheck.value = false;
    } else {
      updateSelectedVeggie(index);

    }
  }


  void updateSelectedVeggie(int index) {
    if (index >= 0 && index < veggieList.length) {
      // 새로운 채소 선택
      selectedVeggieIndex.refresh();
      veggieSelected.assignAll(List<int>.filled(veggieList.length, 0));

      selectedVeggieIndex.value = index;
      // veggieSelected 토글
      veggieSelected[index] = 1;


      print("채소 ${selectedVeggieIndex.value} 선택 여부: ${veggieSelected[index]}");
      print("채소 선택: ${veggieSelected}");

      checkFormValidity(); // 선택 여부 업데이트 후 폼 유효성 체크
      update();
    }
  }

  void checkFormValidity() {
    isCheck.value = veggieSelected.any((element) => element == 1);
    isFormValid.value = isCheck.value;
  }
}

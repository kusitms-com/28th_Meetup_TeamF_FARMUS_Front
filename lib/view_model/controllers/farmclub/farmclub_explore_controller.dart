import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmus_user.dart';

import '../../../data/network/mypage_api_service.dart';
import '../../../model/farmclub_info_model.dart';
import '../../../repository/farmclub_repository.dart';

class FarmclubExploreController extends GetxController {
  RxList<FarmclubInfoModel> farmclubList = <FarmclubInfoModel>[].obs;
  RxList<FarmclubInfoModel> farmclubRecommendList = <FarmclubInfoModel>[].obs;
  Rx<FarmusUser?> user = Rx<FarmusUser?>(null);
  FarmclubInfoModel? selectedFarmclub;


  Future<List<FarmclubInfoModel>> getFarmclubData() async {
    try {
      List<FarmclubInfoModel> responseData =
          await FarmclubRepository.postFarmclub(
        [],
        "All",
        "",
      );

      // RxList 갱신
      farmclubList.clear();
      farmclubList.addAll(responseData);

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }

  Future<List<FarmclubInfoModel>> getFarmclubRecommend() async {
    try {
      List<FarmclubInfoModel> responseData =
          await FarmclubRepository.getFarmclubRecommend();

      // RxList 갱신
      farmclubRecommendList.clear();
      farmclubRecommendList.addAll(responseData);

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }

  Future<FarmusUser?> getUserApi() async {
    try {
      FarmusUser? response = await MypageApiService().getUser();
      user.value = response;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching user data: $error');
      throw error;
    }
  }

  void setSelectedFarmclub(FarmclubInfoModel farmclub) {
    selectedFarmclub = farmclub;
  }

}

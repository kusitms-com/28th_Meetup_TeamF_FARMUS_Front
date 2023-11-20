import 'package:get/get.dart';

import '../../../model/farmclub_info_model.dart';
import '../../../repository/farmclub_repository.dart';

class FarmclubExploreController extends GetxController {
  RxList<FarmclubInfoModel> farmclubList = <FarmclubInfoModel>[].obs;

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
}

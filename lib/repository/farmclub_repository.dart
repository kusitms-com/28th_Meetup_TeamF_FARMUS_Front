import 'package:mojacknong_android/data/network/farmclub_api_service.dart';
import 'package:mojacknong_android/model/farmclub_detail.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';

class FarmclubRepository {
  static Future<List<FarmclubInfoModel>> postFarmclub(
    List<String> difficulties,
    String status,
    String keyword,
  ) async {
    List<FarmclubInfoModel> response =
        await FarmclubApiService().postFarmclubSearch(
      difficulties: difficulties,
      status: status,
      keyword: keyword,
    );

    return response;
  }

  static Future<FarmclubDetail> getFarmclubDetail(
    String id,
  ) async {
    FarmclubDetail response = await FarmclubApiService().getFarmclubDetail(id);

    return response;
  }
}

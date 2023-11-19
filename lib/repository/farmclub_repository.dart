import 'package:mojacknong_android/data/network/farmclub_api_service.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';

class FarmclubRepository {
  static Future<List<FarmclubInfoModel>> getFarmclub(
    List<String> difficulties,
    String status,
    String keyword,
  ) async {
    List<FarmclubInfoModel> response = await FarmclubApiService().getFarmclub(
      difficulties: difficulties,
      status: status,
      keyword: keyword,
    );

    return response;
  }
}

import 'package:mojacknong_android/data/network/farmclub_api_service.dart';
import 'package:mojacknong_android/model/farmclub_detail.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';

class FarmclubRepository {
  static Future<List<FarmclubInfoModel>> postFarmclub(
    List<String> difficulties,
    String status,
    String keyword,
  ) async {
    try {
      List<FarmclubInfoModel> response =
          await FarmclubApiService().postFarmclubSearch(
        difficulties: difficulties,
        status: status,
        keyword: keyword,
      );

      return response;
    } catch (e) {
      print("Error in postFarmclub: $e");
      throw "Error in postFarmclub: $e";
    }
  }

  static Future<FarmclubDetail?> getFarmclubDetail(String id) async {
    try {
      print("challengeId  $id");

      FarmclubDetail? response =
          await FarmclubApiService().getFarmclubDetail(id);
      print("FarmclubDetail~!@!: $response");

      return response;
    } catch (e) {
      print("에러! getFarmclubDetail: $e");
      throw "에러! getFarmclubDetail: $e";
    }
  }
}

import 'package:mojacknong_android/data/network/farmclub_api_service.dart';
import 'package:mojacknong_android/model/farmclub_detail.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';
import 'package:mojacknong_android/model/farmclub_mine.dart';
import 'package:mojacknong_android/model/farmclub_mine_detail.dart';

class FarmclubRepository {

  // 나의 팜클럽 조회
  static Future<List<FarmclubMine>> getFarmclub() async {
    try {
      List<FarmclubMine> response = await FarmclubApiService().getFarmclub();
      print("레포 ${response.runtimeType}");

      return response;
    } catch (e) {
      print("레포 에러 $e");
      throw "레포 에러 $e";
    }
  }

  // 팜클럽 목록 조회
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

  // 팜클럽 정보 조회
  static Future<FarmclubDetail?> getFarmclubDetail(String id) async {
    try {
      print("challengeId  $id");

      FarmclubDetail? response =
      await FarmclubApiService().getFarmclubDetail(id);

      return response;
    } catch (e) {
      print("에러! getFarmclubDetail: $e");
      throw "에러! getFarmclubDetail: $e";
    }
  }

  // 내 팜클럽 정보 조회
  static Future<FarmclubMineDetail?> getFarmclubMineDetail(String id) async {
    try {
      print("challengeId  $id");

      FarmclubMineDetail? response =
      await FarmclubApiService().getFarmclubMineDetail(id);

      return response;
    } catch (e) {
      print("에러! getFarmclubDetail: $e");
      throw "에러! getFarmclubDetail: $e";
    }
  }
}

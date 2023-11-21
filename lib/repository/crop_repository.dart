import 'package:mojacknong_android/data/network/crop_api_service.dart';
import 'package:mojacknong_android/model/crop/crop_info_step.dart';

class CropRepository {
  // 나의 팜클럽 조회
  static Future<List<CropInfoStep>> getCropInfoStep(
      String veggieInfoid, int stepNum) async {
    try {
      List<CropInfoStep> response =
          await CropApiService().getCropVeggieInfoStep(veggieInfoid, stepNum);
      print("레포 ${response.runtimeType}");

      return response;
    } catch (e) {
      throw "레포 에러 $e";
    }
  }
}

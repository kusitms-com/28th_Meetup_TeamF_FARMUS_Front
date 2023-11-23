import 'package:mojacknong_android/data/network/crop_api_service.dart';
import 'package:mojacknong_android/model/crop/crop_info_step.dart';
import 'package:mojacknong_android/model/crop/whole_hint.dart';

class CropRepository {
  // 채소 별 모든 스텝 명
  static Future<List<List<CropInfoStep>>> getCropInfoStep(
      String veggieInfoid, int stepNum) async {
    try {
      List<List<CropInfoStep>> response =
          await CropApiService().getCropVeggieInfoStep(veggieInfoid, stepNum);
      print("레포 ${response.runtimeType}");

      return response;
    } catch (e) {
      throw "레포 에러 $e";
    }
  }

  // 전체 가이드라인
  static Future<List<WholeHint>> getCropWholeHint(
    String veggieInfoid,
  ) async {
    try {
      List<WholeHint> response = await CropApiService().getCropWholeHint(
        veggieInfoid,
      );
      print("레포 ${response.runtimeType}");

      return response;
    } catch (e) {
      throw "레포 에러 $e";
    }
  }
}

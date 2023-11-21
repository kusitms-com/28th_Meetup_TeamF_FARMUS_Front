import 'package:dio/dio.dart';
import 'package:mojacknong_android/model/crop/crop_info_step.dart';

import 'base_api_services.dart';

class CropApiService {
  // 나의 팜클럽 조회
  Future<List<CropInfoStep>> getCropVeggieInfoStep(
    String veggieInfoid,
    int stepNum,
  ) async {
    try {
      Response response =
          await ApiClient().dio.get("/api/crop/$veggieInfoid/info/$stepNum");

      if (response.statusCode == 200) {
        List<List<Map<String, dynamic>>> dataLists =
            List<List<Map<String, dynamic>>>.from(response.data['data']);

        List<CropInfoStep> cropInfoStepList = dataLists.expand((dataList) {
          return dataList.map((data) => CropInfoStep.fromJson(data)).toList();
        }).toList();

        print(cropInfoStepList);

        return cropInfoStepList;
      } else {
        // 오류 발생 시 빈 리스트 반환
        return [];
      }
    } on DioError catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }
}

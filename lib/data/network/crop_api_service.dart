import 'package:dio/dio.dart';
import 'package:mojacknong_android/model/crop/crop_info_step.dart';

import 'base_api_services.dart';
import 'package:mojacknong_android/model/crop/crop_info_step.dart';


class CropApiService {
  Future<List<List<CropInfoStep>>> getCropVeggieInfoStep(
      String veggieInfoid,
      int stepNum,
      ) async {
    try {
      Response response =
      await ApiClient().dio.get("/api/crop/$veggieInfoid/info/$stepNum");

      if (response.statusCode == 200) {
        List<List<dynamic>> dataLists = List<List<dynamic>>.from(response.data['data']);

        List<List<CropInfoStep>> cropInfoStepLists = dataLists.map((dataList) {
          return dataList.map((data) => CropInfoStep.fromJson(data)).toList();
        }).toList();

        print(cropInfoStepLists[0]);
        print(cropInfoStepLists[1]);
        print(cropInfoStepLists[2]);

        return cropInfoStepLists;
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


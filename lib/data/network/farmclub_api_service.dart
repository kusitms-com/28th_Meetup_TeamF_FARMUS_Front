import 'package:dio/dio.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';
import 'package:mojacknong_android/model/farmclub_detail.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';

class FarmclubApiService {
  Future<List<FarmclubInfoModel>> postFarmclubSearch({
    required List<String> difficulties,
    required String status,
    required String keyword,
  }) async {
    try {
      Map<String, dynamic> requestBody = {
        'difficulties': difficulties,
        'status': status,
        'keyword': keyword,
      };

      Response response = await ApiClient().dio.post(
            "/api/farmclub/search",
            data: requestBody,
          );

      if (response.statusCode == 200) {
        print(response.data['data']);

        // response.data['data']가 List 형태인지 확인
        if (response.data['data'] is List) {
          // List가 비어있으면 빈 리스트 반환
          if (response.data['data'].isEmpty) {
            return [];
          }

          // List의 각 요소를 FarmclubInfoModel로 변환하여 리스트에 추가
          List<dynamic> dataList = response.data['data'];
          List<FarmclubInfoModel> farmclubList =
              dataList.map((data) => FarmclubInfoModel.fromJson(data)).toList();
          print(farmclubList.runtimeType);

          return farmclubList;
        } else {
          // List가 아니면 빈 리스트 반환
          return [];
        }
      } else {
        // 오류 발생 시 빈 리스트 반환
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  Future<FarmclubDetail> getFarmclubDetail(String challengeId) async {
    try {
      // API 호출
      Response response = await ApiClient().dio.get(
            "/api/farmclub/$challengeId",
          );

      // 응답 상태 코드 확인
      if (response.statusCode == 200) {
        // 성공적으로 응답받은 경우
        print(response.data['data']);
        return response.data;
      } else {
        // 응답이 실패한 경우
        throw "${response.statusCode}";
      }
    } on DioException catch (e) {
      // DioException 예외 처리
      print(e.message);
      throw "${e.message}";
    }
  }
}

import 'package:dio/dio.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';

class FarmclubApiService {
  Future<List<FarmclubInfoModel>> getFarmclub() async {
    try {
      Response response =
      await ApiClient().dio.get("/api/community/posting/my-posting");

      if (response.statusCode == 200) {

        print(response.data);
        return response.data;
      } else {
        print("서버 에러 ${response.statusCode}");
        throw "${response.statusCode}";
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

}
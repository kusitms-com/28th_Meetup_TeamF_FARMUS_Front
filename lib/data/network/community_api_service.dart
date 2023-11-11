import 'package:dio/dio.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';

class CommunityApiService {
  Future<String> getWholePosting() async {
    try {
      Response response =
          await ApiClient().dio.get("/api/community/posting/whole-posting");
      print(response.data);
      return "";
    } on DioException catch (e) {
      print(e.message);
      print("온보딩실패");
      return "false";
    }
  }
}

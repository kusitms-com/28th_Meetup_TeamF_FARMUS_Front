import 'package:dio/dio.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';

class CommunityApiService {
  // 전체 게시글 조회
  Future<String> getWholePosting() async {
    try {
      Response response =
          await ApiClient().dio.get("/api/community/posting/whole-posting");
      print(response.data);
      return "";
    } on DioException catch (e) {
      print(e.message);
      return "false";
    }
  }

  // 나의 게시글 조회
  Future<String> getMyPosting() async {
    try {
      Response response =
          await ApiClient().dio.get("/api/community/posting/my-posting");
      print(response.data);
      return "";
    } on DioException catch (e) {
      print(e.message);
      return "false";
    }
  }
}

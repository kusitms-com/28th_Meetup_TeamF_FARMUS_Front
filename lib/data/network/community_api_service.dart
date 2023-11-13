import 'package:dio/dio.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';
import 'package:mojacknong_android/model/community_detail.dart';
import 'package:mojacknong_android/model/community_posting.dart';
import 'package:mojacknong_android/model/posting.dart';

class CommunityApiService {
  // 전체 게시글 조회
  Future<List<CommunityPosting>> getWholePosting() async {
    try {
      Response response =
          await ApiClient().dio.get("/api/community/posting/whole-posting");

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['wholePostingDTOList'];
        List<CommunityPosting> posting =
            data.map((json) => CommunityPosting.fromJson(json)).toList();

        print(data);
        print(posting);

        return posting;
      } else {
        print("서버 에러 ${response.statusCode}");
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      return [];
    }
  }

  // 나의 게시글 조회
  Future<List<CommunityPosting>> getMyPosting() async {
    try {
      Response response =
          await ApiClient().dio.get("/api/community/posting/my-posting");

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['wholePostingDTOList'];
        List<CommunityPosting> posting =
            data.map((json) => CommunityPosting.fromJson(json)).toList();

        print(data);
        print(posting);

        return posting;
      } else {
        print("서버 에러 ${response.statusCode}");
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      return [];
    }
  }

  // 게시글 쓰기
  Future<String> postPostingWrite(Posting posting) async {
    try {
      print("태그 ${posting.tag}");
      print("태그 ${posting.file.first.path}");

      FormData formData;
      formData = FormData.fromMap({
        'title': posting.title,
        'contents': posting.contents,
        'tag': posting.tag,
        'file': [
          await MultipartFile.fromFile(posting.file.first.path,
              filename: posting.file.first.path.split('/').last),
        ]
      });
      Response response = await ApiClient()
          .dio
          .post("/api/community/posting/write", data: formData);

      if (response.statusCode == 200) {
        print(response.data);
        return "성공";
      } else {
        return "실패";
      }
    } on DioException catch (e) {
      print("에러 ${e.message}");
      return "false";
    }
  }

  // 게시글 상세 조회
  Future<CommunityDetail> getPostingComments(int posterId, int userId) async {
    try {
      Response response = await ApiClient().dio.get(
        "/api/community/comment/posting-comments",
        queryParameters: {"posterId": posterId, 'userId': userId},
      );

      print(response.data);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data['data'];
        CommunityDetail communityDetail = CommunityDetail.fromJson(data);

        print("데이터 ${communityDetail.postingCommentList}");

        return communityDetail;
      } else {
        print("서버 에러 ${response.statusCode}");
        throw Exception("Failed to load posting comments");
      }
    } on DioError catch (e) {
      print("에러 발생: $e");
      throw Exception("Failed to load posting comments");
    }
  }
}

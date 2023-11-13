import 'package:mojacknong_android/data/network/community_api_service.dart';
import 'package:mojacknong_android/model/community_detail.dart';
import 'package:mojacknong_android/model/community_posting.dart';
import 'package:mojacknong_android/model/posting.dart';

class CommunityRepository {
  static Future<List<CommunityPosting>> getWholePosting() async {
    List<CommunityPosting> response =
        await CommunityApiService().getWholePosting();
    return response;
  }

  static Future<List<CommunityPosting>> getMyPosting() async {
    List<CommunityPosting> response =
        await CommunityApiService().getMyPosting();
    return response;
  }

  static Future<String> postPostingWrite(Posting posting) async {
    String response = await CommunityApiService().postPostingWrite(posting);
    return response;
  }

  static Future<CommunityDetail> getPostingDetails(
      int postingId, int userId) async {
    try {
      CommunityDetail communityDetail =
          await CommunityApiService().getPostingComments(postingId, userId);

      if (communityDetail.postingCommentList == null) {
        return CommunityDetail(
          wholePostingDto: communityDetail.wholePostingDto,
        );
      }

      return communityDetail;
    } catch (e) {
      print("Error getting posting details: $e");
      throw Exception("Failed to load posting details");
    }
  }

  static Future<String> postComment(int postingId, String comment) async {
    String response =
        await CommunityApiService().postCommentWrite(postingId, comment);
    return response;
  }
}

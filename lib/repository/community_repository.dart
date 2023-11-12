import 'package:mojacknong_android/data/network/community_api_service.dart';
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
}

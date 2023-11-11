import 'package:mojacknong_android/data/network/community_api_service.dart';
import 'package:mojacknong_android/model/community_posting.dart';

class CommunityRepository {
  static Future<List<CommunityPosting>> getWholePosting() async {
    List<CommunityPosting> response =
        await CommunityApiService().getWholePosting();
    return response;
  }
}

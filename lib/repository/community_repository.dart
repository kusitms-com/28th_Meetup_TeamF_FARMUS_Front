import 'package:mojacknong_android/data/network/community_api_service.dart';

class CommunityRepository {
  static Future<String> getWholePosting() async {
    String response = await CommunityApiService().getWholePosting();
    return response;
  }
}

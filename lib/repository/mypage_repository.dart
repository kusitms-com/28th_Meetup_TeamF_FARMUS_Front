

import 'package:mojacknong_android/model/farmus_user.dart';

import '../data/network/mypage_api_service.dart';
import '../model/mypage_history.dart';

class MypageRepository {


  static Future<FarmusUser?> getUserApi() async {
    final response = await MypageApiService().getUser();

    return response;
  }


  static Future<MypageHistory?> getHistoryApi() async {

    final response = await MypageApiService().getHistory();

    return response;
  }

  static Future<List<dynamic>> getMyPageData() async {
    final List<Future<dynamic>> futures = [
      getUserApi(),
      getHistoryApi()
    ];
    return Future.wait(futures);
  }




}


import 'package:mojacknong_android/model/farmus_user.dart';

import '../data/network/mypage_api_service.dart';
import '../model/mypage_history.dart';
import '../model/vege_history_detail.dart';
import '../view/my_page/history/my_page_vege_history.dart';

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

  static Future<void> logoutApi() async {

    await MypageApiService().logout();

  }

  static Future<void> userDeleteApi() async {

    await MypageApiService().userDelete();

  }


  static Future<VegeHistoryDetail?> vegeHistoryDetailApi(String detailId) async {

    final reponse = await MypageApiService().vegeHistoryDetail(detailId);

    return reponse;
  }











}
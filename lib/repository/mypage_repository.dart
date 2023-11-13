

import 'package:mojacknong_android/model/farmus_user.dart';

import '../data/network/mypage_api_service.dart';

class MypageRepository {


  static Future<FarmusUser?> getUserApi() async {
    final response = await MypageApiService().getUser();

    return response;
  }


}
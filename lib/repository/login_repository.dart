import 'package:mojacknong_android/data/network/api_service.dart';

class LoginRepository {
  static Future<dynamic> kakaoLoginApi(token) async {
    var response = await ApiServices().fetchKaKaoData(token);
    return response;
  }

  static Future<dynamic> googleLoginApi() async {
    var response = await ApiServices().getGoogleLogin();
    return response;
  }

  static Future<dynamic> reissueApi() async {
    var response = await ApiServices().reissue();
    return response;
  }

  static Future<dynamic> logoutApi() async {
    var response = await ApiServices().logout();
    return response;
  }
}

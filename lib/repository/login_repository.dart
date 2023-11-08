import 'package:mojacknong_android/data/network/login_api_service.dart';

class LoginRepository {
  static Future<dynamic> kakaoLoginApi(token) async {
    String? response = await LoginApiServices().fetchKaKaoData(token);
    return response;
  }

  static Future<dynamic> googleLoginApi() async {
    bool response = await LoginApiServices().getGoogleLogin();
    return response;
  }

  static Future<dynamic> reissueApi() async {
    var response = await LoginApiServices().reissue();
    return response;
  }

  static Future<dynamic> logoutApi() async {
    var response = await LoginApiServices().logout();
    return response;
  }
}

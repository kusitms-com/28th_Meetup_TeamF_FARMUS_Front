import 'package:mojacknong_android/data/network/login_api_service.dart';
import 'package:mojacknong_android/model/farmus_user.dart';

class LoginRepository {
  static Future<FarmusUser> kakaoLoginApi(token) async {
    FarmusUser user = await LoginApiServices().fetchKaKaoData(token);
    print("데이터데이터 $user");
    return user;
  }

  static Future<FarmusUser> googleLoginApi(token) async {
    FarmusUser response = await LoginApiServices().getGoogleLogin(token);
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

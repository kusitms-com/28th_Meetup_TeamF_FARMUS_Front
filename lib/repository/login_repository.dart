import 'package:mojacknong_android/data/network/api_service.dart';
import 'package:mojacknong_android/res/app_url/app_url.dart';

class LoginRepository {
  static Future<dynamic> hitApi() async {
    var response = await ApiServices().getApi(AppUrl.url);
    return response;
  }
}

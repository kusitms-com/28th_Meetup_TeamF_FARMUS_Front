import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mojacknong_android/res/app_url/app_url.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
const storage = FlutterSecureStorage();

Dio dio = Dio(
  BaseOptions(
    baseUrl: AppUrl.url,
  ),
);

Dio authDio = Dio(
  BaseOptions(
    baseUrl: AppUrl.url,
  ),
);

class LoginApiServices {
  Future<String?> fetchKaKaoData(token) async {
    try {
      Response response = await dio.post(
        '/api/user/auth/kakao-login',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      print(response.data);
      await storage.write(
          key: 'refreshToken', value: response.data["refreshToken"]);
      await storage.write(
          key: 'accessToken', value: response.data["accessToken"]);

      final accessGoogleToken = await storage.read(key: 'accessToken');
      final refreshGoogleToken = await storage.read(key: 'refreshToken');

      if (response.data["early"] == false) {
        return "earlyFalse";
      } else if (response.data["early"] == true) {
        return "earlyTrue";
      }
    } on DioError catch (e) {
      print(e.message);
      print("실패");
      return "false";
    }
  }

  Future<bool> getGoogleLogin() async {
    print("구글 로그인 버튼 클릭");

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    print("구글 액세스 토큰 ${googleSignInAuthentication.accessToken}");
    return fetchGoogleData(googleSignInAuthentication.accessToken);
  }

  Future<bool> fetchGoogleData(token) async {
    try {
      print(token.toString());
      Response response = await dio.post(
        '/api/user/auth/google-login',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      print(response.data);
      await storage.write(
          key: 'refreshToken', value: response.data["refreshToken"]);
      await storage.write(
          key: 'accessToken', value: response.data["accessToken"]);

      final accessGoogleToken = await storage.read(key: 'accessToken');
      final refreshGoogleToken = await storage.read(key: 'refreshToken');
      print("성공 \n액세스 : $accessGoogleToken \n리프레시 : $refreshGoogleToken");
      return true;
    } on DioError catch (e) {
      print(e.message);
      print("실패");
      return false;
    }
  }

  Future<String> reissue() async {
    try {
      final token = await storage.read(key: 'refreshToken');
      print("토큰 $token");

      Response response = await dio.get(
        '/api/user/reissue-token',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      print(response.data);
      print("reissue 성공");

      await storage.write(
          key: "accessToken", value: response.data["accessToken"]);
      final newAccessToken = await storage.read(key: 'accessToken');
      print("새 액세스 토큰 : $newAccessToken");
    } on DioError catch (e) {
      print(e.message);
      print(e.response);
      print("reissue 실패");
    }
    return "";
  }

  Future<String> logout() async {
    try {
      final accessToken = await storage.read(key: 'accessToken');

      if (accessToken != null) {
        Response response = await authDio.delete(
          '/api/user/logout',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
        );

        if (response.statusCode == 200) {
          await storage.delete(key: "accessToken");
          await storage.delete(key: "refreshToken");
          print("로그아웃 성공");
          return "success";
        } else {
          print("로그아웃 실패 ${response.statusCode}");
          return "failure";
        }
      } else {
        print("로그아웃 실패 : 액세스 토큰 없음");
        return "failure";
      }
    } on DioError catch (e) {
      print("로그아웃 실패 : ${e.message}");
      if (e.response != null) {
        print("응답 : ${e.response}");
      }
      return "failure";
    }
  }
}

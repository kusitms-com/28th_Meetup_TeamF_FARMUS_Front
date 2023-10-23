import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:mojacknong_android/view/login/app_interceptor.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
const storage = FlutterSecureStorage();

Dio dio = Dio(
  BaseOptions(
    baseUrl: "http://ec2-13-125-15-222.ap-northeast-2.compute.amazonaws.com",
  ),
);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            GestureDetector(
              child: TextButton(
                onPressed: getKakaoLogin,
                child: const Text(
                  "카카오 로그인",
                ),
              ),
            ),
            GestureDetector(
              child: TextButton(
                onPressed: getGoogleLogin,
                child: const Text(
                  "구글 로그인",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getKakaoLogin() async {
    print("카카오 로그인 버튼 클릭");

    bool isInstalled = await isKakaoTalkInstalled();
    OAuthToken? token;

    if (isInstalled) {
      try {
        token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공1');
      } catch (error) {
        print('카카오톡으로 로그인 실패1 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          token = await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공2');
        } catch (error) {
          print('카카오계정으로 로그인 실패2 $error');
        }
      }
    } else {
      try {
        token = await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공3');
        print(token.accessToken);
        fetchKaKaoData(token.accessToken);
      } catch (error) {
        print('카카오계정으로 로그인 실패3 $error');
      }
    }
  }

  Future<void> getGoogleLogin() async {
    print("구글 로그인 버튼 클릭");

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    print("구글 액세스 토큰 ${googleSignInAuthentication.accessToken}");
    fetchGoogleData(googleSignInAuthentication.accessToken);
  }

  Future<void> fetchKaKaoData(token) async {
    dio.interceptors.add(AppInterceptor(dio));
    try {
      Response response = await dio.post(
        '/api/user/auth/kakao-login',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final newToken = await storage.read(key: 'refreshToken');
      print(response.data);
      await storage.write(
          key: 'refreshToken', value: response.data["refreshToken"]);
      final refreshKakaoToken = await storage.read(key: 'refreshToken');
      print("성공 $refreshKakaoToken");
    } on DioError catch (e) {
      print(e.message);
      print("실패");
    }
  }

  Future<void> fetchGoogleData(token) async {
    dio.interceptors.add(AppInterceptor(dio));
    try {
      print(token.toString());
      Response response = await dio.post(
        '/api/user/auth/google-login',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      print(response.data);
      await storage.write(
          key: 'refreshToken', value: response.data["refreshToken"]);

      final refreshGoogleToken = await storage.read(key: 'refreshToken');
      print("성공 $refreshGoogleToken");
    } on DioError catch (e) {
      print(e.message);
      print("실패");
    }
  }
}

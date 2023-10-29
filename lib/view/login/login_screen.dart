import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:mojacknong_android/repository/login_repository.dart';
import 'package:mojacknong_android/view/login/app_interceptor.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
const storage = FlutterSecureStorage();

Dio dio = Dio(
  BaseOptions(
    baseUrl: "http://ec2-13-125-15-222.ap-northeast-2.compute.amazonaws.com",
  ),
);

Dio authDio = Dio(
  BaseOptions(
    baseUrl: "http://ec2-13-125-15-222.ap-northeast-2.compute.amazonaws.com",
  ),
);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    authDio.interceptors.add(AppInterceptor(authDio));

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
                onPressed: googleLogin,
                child: const Text(
                  "구글 로그인",
                ),
              ),
            ),
            GestureDetector(
              child: TextButton(
                onPressed: reissue,
                child: const Text(
                  "토큰 재발급",
                ),
              ),
            ),
            GestureDetector(
              child: TextButton(
                onPressed: logout,
                child: const Text(
                  "로그아웃",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getKakaoLogin() async {
    print("카카오 로그인 버튼 클릭");

    bool isInstalled = await isKakaoTalkInstalled();
    OAuthToken? token;

    if (isInstalled) {
      try {
        token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공1');
        fetchKaKaoData(token.accessToken);
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
          fetchKaKaoData(token.accessToken);
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

  fetchKaKaoData(token) {
    LoginRepository.kakaoLoginApi(token).then((value) {});
  }

  googleLogin() {
    LoginRepository.googleLoginApi().then((value) {});
  }

  reissue() {
    LoginRepository.reissueApi().then((value) {});
  }

  logout() {
    LoginRepository.logoutApi().then((value) {});
  }
}
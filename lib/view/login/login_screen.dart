import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/repository/login_repository.dart';
import 'package:mojacknong_android/view/login/app_interceptor.dart';
import 'package:mojacknong_android/view/main/main_screen.dart';
import 'package:mojacknong_android/view/onboarding/onboarding_screen.dart';

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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    authDio.interceptors.add(AppInterceptor(authDio));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Container(
          color: FarmusThemeData.green1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 32,
              ),
              Center(
                child: SvgPicture.asset(
                  "assets/image/logo_tree.svg",
                  width: 128,
                  height: 128,
                ),
              ),
              Column(
                children: [
                  Bouncing(
                    onPress: () {},
                    child: GestureDetector(
                      onTap: () {
                        kakaoLogin();
                      },
                      child: SvgPicture.asset(
                        "assets/image/kakao_login.svg",
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Bouncing(
                    onPress: () {},
                    child: GestureDetector(
                      onTap: () {
                        googleLogin();
                      },
                      child: SvgPicture.asset(
                        "assets/image/google_login.svg",
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  kakaoLogin() async {
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
    LoginRepository.kakaoLoginApi(token).then(
      (value) {
        if (value == "earlyTrue") {
          print(value);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
        } else if (value == "earlyFalse") {
          print(value);

          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        }
      },
    );
  }

  googleLogin() {
    LoginRepository.googleLoginApi().then(
      (value) {
        if (value == "earlyTrue") {
          print(value);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
        } else if (value == "earlyFalse") {
          print(value);

          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        }
      },
    );
  }

  reissue() {
    LoginRepository.reissueApi().then((value) {});
  }

  logout() {
    LoginRepository.logoutApi().then((value) {});
  }
}

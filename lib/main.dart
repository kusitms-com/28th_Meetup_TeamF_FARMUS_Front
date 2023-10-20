import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:mojacknong_android/firebase_options.dart';
import 'package:mojacknong_android/view/login/loginScreen.dart';

void main() async {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하기 위함
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: 'e0e5595eef76546ac7d980217627e9bf',
    javaScriptAppKey: '7f2a1972870b2cadb2a0506a7e309020',
  );

  runApp(const LoginScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}

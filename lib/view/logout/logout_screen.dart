import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: getKakaoLogout,
                          child: Text('카카오톡 로그아웃'),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

void getKakaoLogout() async {
  print("카카오 로그아웃 버튼 클릭");
  //bool isInstalled = await isKakaoTalkInstalled();
  //OAuthToken? token;

  try {
    await UserApi.instance.logout();
    print('카카오톡으로 로그아웃 성공');
  } catch (error) {
    print('로그아웃 실패, SDK에서 토큰 삭제 $error');
    print('에러 메시지: ${error.toString()}');

    try {
      await UserApi.instance.unlink();
      print('연결 끊기 성공, SDK에서 토큰 삭제');
    } catch (error) {
      print('연결 끊기 실패 $error');
      print('에러 메시지: ${error.toString()}');
    }
  }
}

Future sendDeleteRequest(token) async {
  final url = Uri.parse(
      'http://ec2-43-202-6-54.ap-northeast-2.compute.amazonaws.com/api/user/auth/kakao-logout');

  // DELETE 요청 보내기
  final response = await http.delete(
    url,
    headers: {'Authentication': "Bearer $token"},
  );

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('Error: ${response.statusCode}');
  }
}

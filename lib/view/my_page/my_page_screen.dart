import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/my_page/component/my_challenge_header.dart';
import 'package:mojacknong_android/view/my_page/component/my_history_header.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_header.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_history.dart';

void main() => runApp(const MyPageScreen());

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPageHome(),
    );
  }
}

class MyPageHome extends StatelessWidget {
  const MyPageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const MyPageHeader(name: '파머', date: '100'), // 사용자 정의 헤더를 여기에 넣습니다.
          const SizedBox(height: 12.0), // 필요한 공간을 추가합니다.

          const HistoryHeader(historyType: "팜 히스토리"),
          const SizedBox(height: 12.0),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 4.0),
              children: const <Widget>[
                MyPageHistory(
                  name: '상훈이',
                  nickname: '상추',
                  date: '2023.10.01~2023.11.22',
                ),
                MyPageHistory(
                  name: '먹쟁이토마토',
                  nickname: '방울토마토',
                  date: '2023.06.27~현재',
                ),
                MyPageHistory(
                  name: '깨르륵',
                  nickname: '깻잎',
                  date: '2023.05.03~현재',
                ),
                // 추가하려면 여기에 넣기
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          const ChallengeHeader(historyType: "챌린지 히스토리"),
          const SizedBox(height: 12.0),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 4.0),
              children: const <Widget>[
                MyPageHistory(
                  name: '상추 좋아하세요',
                  nickname: '상추',
                  date: '2023.10.01~2023.11.22',
                ),
                MyPageHistory(
                  name: '남아프리카공화국',
                  nickname: '파프리카',
                  date: '2023.06.27~현재',
                ),
                MyPageHistory(
                  name: '깨르륵깨르륵',
                  nickname: '깻잎',
                  date: '2023.05.03~현재',
                ),
                // 추가하려면 여기에 넣기
              ],
            ),
          ),
        ],
      ),
    );
  }
}

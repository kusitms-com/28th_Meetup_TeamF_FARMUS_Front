import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_bar.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_history.dart';

// 팜클럽 히스토리 화면
class MyFarmClubHistory extends StatelessWidget {
  const MyFarmClubHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyPageAppBar(
        // 여기에서 바로 MyPageAppBar를 사용합니다.
        title: '팜클럽 히스토리',
        onBackButtonPressed: () =>
            Navigator.of(context).pop(), // 뒤로 가기 버튼 동작 설정
      ),
      body: Column(
        // Column 위젯으로 감싸서 여러 자식을 나열할 수 있게 합니다.
        children: [
          const SizedBox(height: 0), // 상단 여백 추가
          Expanded(
            // Expanded로 ListView를 감싸서 나머지 공간을 모두 차지하게 합니다.
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

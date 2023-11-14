import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_history.dart';

class MyFarmClubHistory extends StatelessWidget {
  const MyFarmClubHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "팜클럽 히스토리"),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        children: [
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

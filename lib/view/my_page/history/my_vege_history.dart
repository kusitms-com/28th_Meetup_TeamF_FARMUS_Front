import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_history.dart';

// 채소 히스토리 화면
class MyVegeHistory extends StatelessWidget {
  const MyVegeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "채소 히스토리"),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        children: [
          const SizedBox(height: 0), // 상단 여백 추가
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 4.0),
              children: const <Widget>[
                MyPageHistory(
                  name: '상훈이',
                  veggieName: '상추',
                  period: '2023.10.01~2023.11.22',
                ),
                MyPageHistory(
                  name: '먹쟁이토마토',
                  veggieName: '방울토마토',
                  period: '2023.06.27~현재',
                ),
                MyPageHistory(
                  name: '깨르륵',
                  veggieName: '깻잎',
                  period: '2023.05.03~현재',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

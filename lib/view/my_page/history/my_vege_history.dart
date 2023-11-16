import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_history.dart';

import '../../../model/mypage_history.dart';
import '../../../repository/mypage_repository.dart';
import '../component/my_page_header.dart';

// 채소 히스토리 화면
class MyVegeHistory extends StatelessWidget {
  const MyVegeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "채소 히스토리"),
      backgroundColor: FarmusThemeData.white,
      body: FutureBuilder(
          future: MypageRepository.getHistoryApi(),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              print("화면 로딩 중");
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // 에러가 발생한 경우
              return Text('Error: ${snapshot.error}');
            } else {
              // 데이터가 성공적으로 도착한 경우

              final data = snapshot.data;

              return ListView.builder(
                padding: const EdgeInsets.only(top: 4.0),
                itemCount: data?.veggieHistoryDetailList.length ?? 0,
                itemBuilder: (context, index) {
                  final reversedIndex = data!.veggieHistoryDetailList.length - index - 1;
                  return MyPageHistory(
                    name: data.veggieHistoryDetailList[reversedIndex].name,
                    veggieName: data.veggieHistoryDetailList[reversedIndex].veggieName,
                    period: data.veggieHistoryDetailList[reversedIndex].period,
                    image: data.veggieHistoryDetailList[reversedIndex].image,
                  );
                },
              );
            }
          }
      )
    );
  }
}

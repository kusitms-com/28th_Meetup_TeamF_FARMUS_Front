import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/my_page/history/my_page_vege_history.dart';

import '../../../repository/mypage_repository.dart';

class MyFarmClubHistory extends StatelessWidget {
  const MyFarmClubHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppBar(title: "팜클럽 히스토리"),
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
                  itemCount: data?.farmClubHistoryDetailList.length ?? 0,
                  itemBuilder: (context, index) {
                    final reversedIndex =
                        data!.farmClubHistoryDetailList.length - index - 1;
                    return MyPageVegeHistory(
                      name: data.farmClubHistoryDetailList[reversedIndex].name,
                      veggieName: data
                          .farmClubHistoryDetailList[reversedIndex].veggieName,
                      period:
                          data.farmClubHistoryDetailList[reversedIndex].period,
                      image:
                          data.farmClubHistoryDetailList[reversedIndex].image,
                    );
                  },
                );
              }
            }));
  }
}

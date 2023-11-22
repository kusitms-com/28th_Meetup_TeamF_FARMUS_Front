import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/my_page/component/my_challenge_header.dart';
import 'package:mojacknong_android/view/my_page/component/my_history_header.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_header.dart';
import 'package:mojacknong_android/view/my_page/history/my_page_farm_history.dart';
import 'package:mojacknong_android/view/my_page/history/my_page_vege_history.dart';

import '../../model/farmus_user.dart';
import '../../model/mypage_history.dart';
import '../../repository/mypage_repository.dart';
import 'my_farmclub_history_screen.dart';
import 'history_vege_screen.dart';

class MyPageScreen extends StatefulWidget {
  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FarmusThemeData.white,
        body: FutureBuilder(
            future: MypageRepository.getMyPageData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print("화면 로딩 중");
                return Center(
                    child: CircularProgressIndicator(
                  color: FarmusThemeData.background,
                ));
              } else if (snapshot.hasError) {
                // 에러가 발생한 경우
                return Text('Error: ${snapshot.error}');
              } else {
                // 데이터가 성공적으로 도착한 경우
                //  final data = snapshot.data;
                final List<dynamic> data = snapshot.data as List<dynamic>;
                final FarmusUser? user = data[0] as FarmusUser?;
                final MypageHistory? history = data[1] as MypageHistory?;

                print( history?.veggieHistoryDetailList[0].detailId);



                return Column(children: <Widget>[
                  MyPageHeader(
                      name: user?.nickName,
                      date: user?.dday,
                      imagePath: user?.userImageUrl), // 사용자 정의 헤더를 여기에 넣습니다.
                  const SizedBox(height: 12.0), // 필요한 공간을 추가합니다.

                  HistoryHeader(historyType: "채소 히스토리"),
                  const SizedBox(height: 12.0),
                  Expanded(
                    child: history?.veggieHistoryDetailList != null
                        ? ListView.builder(
                            padding: const EdgeInsets.only(top: 4.0),
                            itemCount:
                                min(3, history!.veggieHistoryDetailList.length),
                            itemBuilder: (context, index) {
                              final reversedIndex =
                                  history.veggieHistoryDetailList.length -
                                      index -
                                      1;
                              return GestureDetector(
                                onTap: () {
                                  HistoryVegeScreen(
                                    name: history.veggieHistoryDetailList[reversedIndex].name,
                                    veggieName: history.veggieHistoryDetailList[reversedIndex].veggieName,
                                    period: history.veggieHistoryDetailList[reversedIndex].period,
                                    image: history.veggieHistoryDetailList[reversedIndex].image,
                                    detailId: history.veggieHistoryDetailList[reversedIndex].detailId,
                                  );

                                },
                                child: MyPageVegeHistory(
                                  name: history.veggieHistoryDetailList[reversedIndex].name,
                                  veggieName: history.veggieHistoryDetailList[reversedIndex].veggieName,
                                  period: history.veggieHistoryDetailList[reversedIndex].period,
                                  image: history.veggieHistoryDetailList[reversedIndex].image,
                                  detailId: history.veggieHistoryDetailList[reversedIndex].detailId,
                                ),
                              );
                            },
                          )
                        : noData(),
                  ),

                  const SizedBox(height: 10.0),
                  ChallengeHeader(historyType: "팜클럽 히스토리"),
                  const SizedBox(height: 12.0),
                  Expanded(
                    child: history?.farmClubHistoryDetailList != null
                        ? ListView.builder(
                            padding: const EdgeInsets.only(top: 4.0),
                            itemCount: min(
                                3, history!.farmClubHistoryDetailList.length),
                            itemBuilder: (context, index) {

                              final reversedIndex =
                                  history.farmClubHistoryDetailList.length -
                                      index -
                                      1;
                              return GestureDetector(

                                onTap: () {
                                  MyFarmclubHistoryScreen(
                                    detailId: history
                                        .farmClubHistoryDetailList[reversedIndex]
                                        .detailId,
                                  );
                                },
                                child: MyPageFarmHistory(
                                  name: history
                                      .farmClubHistoryDetailList[reversedIndex]
                                      .name,
                                  veggieName: history
                                      .farmClubHistoryDetailList[reversedIndex]
                                      .veggieName,
                                  period: history
                                      .farmClubHistoryDetailList[reversedIndex]
                                      .period,
                                  image: history
                                      .farmClubHistoryDetailList[reversedIndex]
                                      .image,
                                  detailId: history
                                      .farmClubHistoryDetailList[reversedIndex]
                                      .detailId,

                                )
                              );

                            },
                          )
                        : noData(),
                  ),
                ]);
              }
            }));
  }

  bool isCheckNull(List<dynamic>? list) {
    if (list!.isEmpty) {
      return true;
    }
    return false;
  }

  Center noData() {
    return const Center(child: Text("히스토리가 없습니다."));
  }
}

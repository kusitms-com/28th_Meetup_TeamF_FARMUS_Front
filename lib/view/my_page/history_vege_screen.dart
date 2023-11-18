import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/my_page/component/diary_picture.dart';
import 'package:mojacknong_android/view/my_page/history/my_page_vege_history.dart';

class HistoryVegeScreen extends StatelessWidget {
  final String? data;

  const HistoryVegeScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 탭의 개수
      child: Scaffold(
        appBar: PrimaryAppBar(
          title: "채소 히스토리",
        ),
        backgroundColor: FarmusThemeData.white,
        body: Column(
          children: [
            MyPageVegeHistory(
              image: null,
              name: "상훈이",
              veggieName: '상추',
              period: '2023/10/01~2023/11/22',
            ),
            TabBar(
              tabs: [
                Tab(text: "성장일기"),
                Tab(text: "재배 결과"),
              ],
              labelColor: FarmusThemeData.dark,
              labelPadding: EdgeInsets.zero,
              labelStyle: FarmusThemeData.darkStyle17,
              unselectedLabelStyle: FarmusThemeData.grey3Style17,
              indicatorColor: FarmusThemeData.dark,
              indicatorSize: TabBarIndicatorSize.label,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // 첫 번째 탭에 표시될 화면
                  SingleChildScrollView(
                    child: Container(
                      child: Center(
                          child: Column(
                        children: [
                          DiaryPicture(),
                          DiaryPicture(),
                          DiaryPicture(),
                        ],
                      )),
                    ),
                  ),
                  // 두 번째 탭에 표시될 화면
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "등록된 재배 결과가 없어요",
                          style: FarmusThemeData.grey1Style16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: ButtonBrown(
                            text: "+ 재배 결과 등록하기",
                            enabled: RxBool(true),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

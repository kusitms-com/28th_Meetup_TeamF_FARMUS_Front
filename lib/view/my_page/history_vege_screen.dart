import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/my_page/component/diary_picture.dart';
import 'package:mojacknong_android/view/my_page/history/my_page_vege_history.dart';

import '../../data/network/mypage_api_service.dart';
import '../../repository/mypage_repository.dart';

class HistoryVegeScreen extends StatefulWidget {
  final String? name;
  final String? veggieName;
  final String? period;
  final String? image;
  final String? detailId;

  const HistoryVegeScreen({Key? key,
    required this.detailId,
    required this.name,
    required this.veggieName,
    required this.period,
    required this.image,

  }) : super(key: key);

  @override
  State<HistoryVegeScreen> createState() => _HistoryVegeScreenState();
}

class _HistoryVegeScreenState extends State<HistoryVegeScreen> {

  late String detailId;

  @override
  void initState() {
    super.initState();

    detailId = widget.detailId!; // 'widget.detailId'로 초기화

    // 이곳에서 필요한 초기화 작업 수행
    // MypageRepository.vegeHistoryDetailApi(detailId);
  }

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 2, // 탭의 개수
      child: Scaffold(
        appBar: PrimaryAppBar(
          title: "채소 히스토리",
        ),
        backgroundColor: FarmusThemeData.white,
        body: FutureBuilder(
          future: MypageRepository.vegeHistoryDetailApi(detailId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
            print("화면 로딩 중");
            return CircularProgressIndicator();
            } else if (snapshot.hasError) {
            // 에러가 발생한 경우
            return Text('Error: ${snapshot.error}');
            } else {

            print(snapshot.data?.farmResult);


            return Column(
              children: [
                MyPageVegeHistory(
                  image: widget.image,
                  name: widget.name,
                  veggieName: widget.veggieName,
                  period: widget.period,
                  detailId: widget.detailId,
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

                            ListView.builder(
                              padding: const EdgeInsets.only(top: 4.0),
                              itemCount: snapshot.data?.diaryPostList.length,
                              itemBuilder: (context, index) {
                                return DiaryPicture(
                                  dateTime: snapshot.data?.diaryPostList[index].dateTime,
                                  content: snapshot.data?.diaryPostList[index].content,
                                  postImage: snapshot.data?.diaryPostList[index].postImage,
                                );
                              },
                            ),

                      // 두 번째 탭에 표시될 화면
                      // DiaryPicture(
                      // dateTime: snapshot.data?.farmResult["dateTime"],
                      // content: snapshot.data?.farmResult["content"],
                      // postImage: snapshot.data?.farmResult["postImage"],
                      // ),



                          // 두 번째 탭에 표시될 화면
                          if (!snapshot.data!.farmResult.isEmpty)
                            DiaryPicture(
                              dateTime: snapshot.data!.farmResult["dateTime"],
                              content: snapshot.data!.farmResult["content"],
                              postImage: snapshot.data!.farmResult["postImage"],
                            )
                          else
                            Column(
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

                    ],
                  ),
                ),
              ],
            );

          }
         }


        )));

  }
}

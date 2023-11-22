import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_app_bar.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_box.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_card.dart';
import 'package:mojacknong_android/view/home/component/diary/write_diary.dart';
import 'package:mojacknong_android/view/home/component/register/customs/register_button.dart';

import '../../../../model/my_vege_list.dart';
import '../../../../repository/homescreen_repository.dart';
import '../../../../view_model/controllers/diary_controller.dart';
import '../home_green_box_user.dart';
import 'empty_card.dart';

class DiaryScreen extends StatefulWidget {
  final String? userNickName;
  final int? vegeId;
  final String? nickname;
  final String? image;
  final int? age;

  const DiaryScreen(
      {Key? key,
      this.userNickName,
      this.vegeId,
      this.nickname,
      this.image,
      this.age})
      : super(key: key);

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final DiaryController diaryController = Get.put(DiaryController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DiaryAppBar(title: '${widget.userNickName}'),
        backgroundColor: FarmusThemeData.white,
        body: FutureBuilder(
            future: HomeScreenRepository.getMyVegeDiaryListApi(widget.vegeId!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print("화면 로딩 중");
                return const Center(
                  child: CircularProgressIndicator(
                    color: FarmusThemeData.background,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 244,
                      child: DiaryBox(
                        nickname: "${widget.nickname}",
                        imageWidget: Image.network(
                          "${widget.image}",
                          height: 100,
                        ),
                        age: widget.age,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, top: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "성장일기",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Expanded(
                      //만약 일기 썼던 데이터가 없으면 empty_card.dart의 EmptyCard() 호출
                      child: snapshot.data!.diaryPostList.isEmpty
                          ? EmptyCard()
                          : ListView.builder(
                              padding: const EdgeInsets.only(top: 4.0),
                              itemCount: snapshot.data?.diaryPostList.length,
                              itemBuilder: (context, index) {
                                return DiaryCard(
                                  date:
                                      snapshot.data?.diaryPostList[index].date,
                                  image:
                                      snapshot.data?.diaryPostList[index].image,
                                  content: snapshot
                                      .data?.diaryPostList[index].content,
                                );
                              },
                            ),
                    ),
                    RegisterButton(
                        text: '일기 작성하기',
                        onPressed: () async {

                          diaryController.userNickname(widget.userNickName);
                          diaryController.nickname(widget.nickname);
                          diaryController.image(widget.image);
                          diaryController.vegeId(widget.vegeId);
                          diaryController.age(widget.age);

                          String? result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WriteDiary(vegeId: widget.vegeId);
                              },
                            ),
                          );

                          if (result != null) {
                            print(1);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiaryScreen(
                                  userNickName:
                                      diaryController.userNickname.value,
                                  vegeId: diaryController.vegeId.value,
                                  nickname: diaryController.nickname.value,
                                  image: diaryController.image.value,
                                  age: diaryController.age.value,
                                ),
                              ),
                            );
                          }
                        }),
                  ],
                );
              }
            }));
  }
}

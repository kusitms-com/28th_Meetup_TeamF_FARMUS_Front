import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/display_text_widget.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/routine_list.dart';
import 'package:mojacknong_android/view/home/detail/home_content.dart';
import 'package:mojacknong_android/view/home/detail/today_routine_list.dart';

import '../../common/farmus_theme_data.dart';
import '../../model/current_mission_list.dart';
import '../../model/my_vege_routine_list.dart';

class HomeWithVege extends StatelessWidget {
  CurrentMissionList? currentMissionList;
  MyVegeRoutineList? myVegeRoutineList;

  HomeWithVege(
      {Key? key,
      required this.currentMissionList,
      required this.myVegeRoutineList})
      : super(key: key);

  double calculateVeggieTextWidth(String text) {
    final textPainter = TextPainter(
      text: TextSpan(
          text: text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.bold,
          )),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.width;
  }

  @override
  Widget build(BuildContext context) {
    const mathplusWidth = 22.0;
    const additionalPadding = 50.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("팜클럽 미션", style: FarmusThemeData.darkStyle14),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 4.0),
            itemCount: currentMissionList?.missions.length,
            itemBuilder: (context, index) {
              return HomeContent(
                challengeId: currentMissionList?.missions[index].challengeId,
                veggieNickname:
                    currentMissionList?.missions[index].veggieNickname,
                stepNum: currentMissionList?.missions[index].stepNum,
                stepName: currentMissionList?.missions[index].stepName,
                color: currentMissionList?.missions[index].color,
                detailId: currentMissionList?.missions[index].detailId,
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "오늘의 루틴",
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // 채소별로 돌아가면서 띄워줄건데요
            children: myVegeRoutineList!.diaryPostList.map((veggie) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 채소 별명이랑 색 띄워주는 부분
                    Container(
                        width:
                            calculateVeggieTextWidth(veggie.veggieNickname!) +
                                additionalPadding,
                        margin: const EdgeInsets.only(
                            top: 12.0, left: 20.0, right: 20),
                        child: Row(children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              // #XXXXXX -> 0xffXXXXXX
                              color: Color(int.parse(
                                  '0xff' + veggie.color!.substring(1))),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: veggie.veggieNickname,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
                    Column(
                      // 루틴들 띄워주는 부분
                      children: veggie.routineList.map((routine) {
                        return DisplayTextWidget(
                          textFieldController:
                              TextEditingController(text: routine.routineName),
                          routineId: routine.routineId!,
                          isDone: routine.isDone!,
                          period: routine.period!,
                          text: routine.routineName!,
                        );
                      }).toList(),
                    )
                  ]);
            }).toList()),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/home/detail/home_content.dart';
import 'package:mojacknong_android/view/home/detail/today_routine_list.dart';

import '../../common/farmus_theme_data.dart';
import '../../model/current_mission_list.dart';
import '../../model/my_vege_routine_list.dart';

class HomeWithVege extends StatelessWidget {

  CurrentMissionList? currentMissionList;
  MyVegeRoutineList? myVegeRoutineList;


   HomeWithVege({
    Key? key,
    required this.currentMissionList,
    required this.myVegeRoutineList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "팜클럽 미션",
            style: FarmusThemeData.darkStyle14
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 4.0),
            itemCount: currentMissionList?.missions.length,
            itemBuilder: (context, index) {
              return HomeContent(
                challengeId: currentMissionList?.missions[index].challengeId,
                veggieNickname: currentMissionList?.missions[index].veggieNickname,
                stepNum: currentMissionList?.missions[index].stepNum,
                stepName: currentMissionList?.missions[index].stepName,
                color: currentMissionList?.missions[index].color,

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
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 4.0),
            itemCount: currentMissionList?.missions.length,
            itemBuilder: (context, index) {
              return TodayRoutineList(
                  text: "군것질 그만 하기"
              );
            },
          ),
        ),
      ],
    );
  }
}

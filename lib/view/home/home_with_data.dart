import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/home/detail/home_content.dart';
import 'package:mojacknong_android/view/home/detail/today_routine_list.dart';

class HomeWithVege extends StatelessWidget {
  const HomeWithVege({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "팜클럽 미션",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 4.0),
            children: const [
              HomeContent(),
              HomeContent(),
              HomeContent(),
            ],
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
          child: ListView(
            padding: const EdgeInsets.only(left: 8),
            children: const [
              TodayRoutineList(text: "물 갈아 주기"),
              TodayRoutineList(text: "하루에 물 한 번 주기"),
              TodayRoutineList(text: "군것질 그만 하기"),
              TodayRoutineList(text: "군것질 그만 하기"),
            ],
          ),
        ),
      ],
    );
  }
}

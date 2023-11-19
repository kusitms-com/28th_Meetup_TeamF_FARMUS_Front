import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/home/component/home_farmclub.dart';

class DataLoadedWidget extends StatelessWidget {
  final String name;
  final String mission;
  final String num;

  const DataLoadedWidget({
    Key? key,
    required this.name,
    required this.mission,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeFarmClub(
      nameFuture: Future.value(name),
      missionFuture: Future.value(mission),
      numFuture: Future.value(num),
      onTap: () {},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/main.dart';
import 'package:mojacknong_android/model/routine_month_dto.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/display_text_widget.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/mission_routine_controller.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/n_routine.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/n_routine_controller.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/routine_list.dart';

class DayRoutineWidget extends StatefulWidget {
  final VoidCallback resetFunciton;

  const DayRoutineWidget({
    Key? key,
    required this.resetFunciton,
  }) : super(key: key);

  @override
  _DayRoutineWidgetState createState() => _DayRoutineWidgetState();
}

class _DayRoutineWidgetState extends State<DayRoutineWidget> {
  final NRoutineController nRoutineController = Get.find();
  final MissionRoutineController controller = Get.find();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    setState(() {
      nRoutineController.updateRoutines(controller.dayEvents);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // 채소별로 돌아가면서 띄워줄건데요
        children: nRoutineController.routines.map((routine) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 채소 별명이랑 색 띄워주는 부분
                RoutineListItem(
                  veggieId: routine.veggieId,
                  veggieNickname: routine.veggieNickname,
                  color: routine.color,
                  resetFunciton: widget.resetFunciton,
                ),
                Column(
                  // 루틴들 띄워주는 부분
                  children: routine.routineList.map((routineDay) {
                    return DisplayTextWidget(
                      textFieldController:
                          TextEditingController(text: routineDay.routineName),
                      routineId: routineDay.routineId,
                      isDone: routineDay.isDone,
                      period: routineDay.period,
                      text: routineDay.routineName,
                    );
                  }).toList(),
                )
              ]);
        }).toList()));
  }
}

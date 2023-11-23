import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/routine_list.dart';

class RoutineCalendar extends StatefulWidget {
  RxList<dynamic> selectedEvents = [].obs;

  RoutineCalendar({Key? key, required this.selectedEvents}) : super(key: key);

  @override
  _RoutineCalendarState createState() => _RoutineCalendarState();
}

class _RoutineCalendarState extends State<RoutineCalendar> {
  void onDaySelected(List<dynamic> selectedEvents) {
    setState(() {
      widget.selectedEvents.value = selectedEvents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...(widget.selectedEvents
            .map((event) => RoutineListItem(
                  veggieId: event.veggieId,
                  veggieNickname: event.veggieNickname,
                  color: event.color,
                  resetFunciton: () {},
                ))
            .toList()),
      ],
    );
  }
}

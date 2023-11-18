import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/routine_list.dart';

class RoutineCalendar extends StatefulWidget {
  final List? selectedEvents;

  const RoutineCalendar({Key? key, this.selectedEvents}) : super(key: key);

  @override
  _RoutineCalendarState createState() => _RoutineCalendarState();
}

class _RoutineCalendarState extends State<RoutineCalendar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...(widget.selectedEvents
                ?.map((event) => RoutineListItem(
                      veggieNickname: event.toString(),
                      onTap: () {},
                    ))
                .toList() ??
            []),
      ],
    );
  }
}

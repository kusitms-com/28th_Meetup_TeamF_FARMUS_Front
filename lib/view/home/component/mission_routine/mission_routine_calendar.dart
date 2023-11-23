import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/data/network/home_screen_api_service.dart';
import 'package:mojacknong_android/model/routine_month_dto.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/calendar_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class MissionRoutineCalendar extends StatefulWidget {
  final Function(DateTime selectedDay, DateTime focusedDay,
      List<RoutineMonthDto> selectedEvents) onDaySelected;

  const MissionRoutineCalendar({Key? key, required this.onDaySelected})
      : super(key: key);

  @override
  _MissionRoutineCalendarState createState() => _MissionRoutineCalendarState();
}

class _MissionRoutineCalendarState extends State<MissionRoutineCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  CalendarController controller = Get.find();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ko_KR', null);
  }

  List<RoutineMonthDto> _getMarksForDay(DateTime day) {
    bool isExist = false;
    controller.eventsMap[day]?.forEach((element) {
      if (element.routineList.isNotEmpty) {
        isExist = true;
      }
    });

    if (isExist) {
      return controller.eventsMap[day]!;
    } else {
      return [];
    }
  }

  List<RoutineMonthDto> _getEventsForDay(DateTime day) {
    return controller.eventsMap[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            headerVisible: false,
            rowHeight: 52.0,
            daysOfWeekHeight: 42.0,
            // 여기 위에도 그냥 기본 설정임
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                controller.updateCurrentDate(selectedDay);
                controller.dayEvents.value = _getEventsForDay(selectedDay);
              });
              widget.onDaySelected(
                  selectedDay, focusedDay, controller.dayEvents);
            },
            // 이 밑은 그냥 꾸미는거임
            eventLoader: _getMarksForDay,
            calendarStyle: const CalendarStyle(
                cellPadding: EdgeInsets.all(10.0),
                markersMaxCount: 1,
                markerMargin: EdgeInsets.symmetric(vertical: 8.0),
                markerSize: 8.0,
                markersAlignment: Alignment.bottomCenter,
                isTodayHighlighted: false,
                markerDecoration: BoxDecoration(
                  color: FarmusThemeData.grey3,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: FarmusThemeData.brownButton,
                  shape: BoxShape.circle,
                ),
                cellMargin: EdgeInsets.all(7)),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              formatButtonShowsNext: false,
              leftChevronVisible: false,
              rightChevronVisible: false,
            ),
            locale: 'ko_KR',
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

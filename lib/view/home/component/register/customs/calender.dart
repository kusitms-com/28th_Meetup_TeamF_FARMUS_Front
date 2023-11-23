import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../view_model/controllers/vege_controller.dart';

class CustomCalendar extends StatefulWidget {
  CustomCalendar({Key? key}) : super(key: key);
 // final VegeController vegeController = Get.find();

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final VegeController vegeController = Get.find();
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;


  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ko_KR', null);
  }

  @override
  Widget build(BuildContext context) {
    return MyCustomCalendar(
      focusedDay: _focusedDay,
      selectedDay: _selectedDay,
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          vegeController.updateSelectedDate(DateFormat('yyyy-MM-dd').format(selectedDay));
          // 선택된 날짜 정보 콘솔 출력을 확인가능
        }
      },
    );



  }
}

class MyCustomCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Function(DateTime, DateTime) onDaySelected;

  const MyCustomCalendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2023, 1, 1),
      lastDay: DateTime.utc(2025, 12, 31),
      focusedDay: focusedDay,
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekVisible: true,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      locale: 'ko_KR', // 한글 로케일 설정

      onDaySelected: onDaySelected,
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: false,
        selectedDecoration: BoxDecoration(
          color: FarmusThemeData.brownButton,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(color: FarmusThemeData.white),
        todayDecoration: BoxDecoration(
          color: FarmusThemeData.brownButton,
          shape: BoxShape.circle,
        ),

        defaultDecoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),

      headerStyle: const HeaderStyle(
        titleTextStyle: FarmusThemeData.darkStyle14,
        formatButtonVisible: false,
        titleCentered: true,
        formatButtonShowsNext: false,
      ),
    );
  }
}

void main() {
  runApp( MaterialApp(home: CustomCalendar()));
}

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:table_calendar/table_calendar.dart';

class DiaryCustomCalendar extends StatefulWidget {
  final DateTime initialDate;

  const DiaryCustomCalendar({Key? key, required this.initialDate})
      : super(key: key);

  @override
  _DiaryCustomCalendarState createState() => _DiaryCustomCalendarState();
}

class _DiaryCustomCalendarState extends State<DiaryCustomCalendar> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.initialDate; // Use the initialDate from the widget
    _selectedDay = null; // Or set to widget.initialDate if needed
    initializeDateFormatting('ko_KR', null);
  }

  @override
  Widget build(BuildContext context) {
    print('달력 생성');
    return MyCustomCalendar(
      focusedDay: _focusedDay,
      selectedDay: _selectedDay,
      onDaySelected: (selectedDay, focusedDay) async {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          await Future.delayed(const Duration(milliseconds: 500));
          Navigator.pop(context, selectedDay);
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
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: TableCalendar(
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2025, 12, 31),
        focusedDay: focusedDay,
        calendarFormat: CalendarFormat.month,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        daysOfWeekVisible: true,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        locale: 'ko_KR', // 한글 로케일 설정
        headerVisible: false,
        rowHeight: 52.0,
        daysOfWeekHeight: 50.0,
        onDaySelected: onDaySelected,
        calendarStyle: const CalendarStyle(
          isTodayHighlighted: false,
          selectedDecoration: BoxDecoration(
            color: FarmusThemeData.brownButton,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(color: Colors.white),
          defaultDecoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          formatButtonShowsNext: false,
          leftChevronVisible: false,
          rightChevronVisible: false,
        ),
      ),
    );
  }
}

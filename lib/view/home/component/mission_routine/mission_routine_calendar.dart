import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/data/network/home_screen_api_service.dart';
import 'package:table_calendar/table_calendar.dart';

class MissionRoutineCalendar extends StatefulWidget {
  final Function(DateTime selectedDay, DateTime focusedDay,
      List<dynamic> selectedEvents) onDaySelected;

  const MissionRoutineCalendar({Key? key, required this.onDaySelected})
      : super(key: key);

  @override
  _MissionRoutineCalendarState createState() => _MissionRoutineCalendarState();
}

class _MissionRoutineCalendarState extends State<MissionRoutineCalendar> {
  Map<DateTime, List> _events = {};
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List? _selectedEvents;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ko_KR', null);
    _selectedDay = _focusedDay;
    _fetchEventData();
  }

  void _fetchEventData() async {
    var apiData = await HomeScreenApiService().getDataFromApi();
    setState(() {
      _events = {
        DateTime.utc(2023, 11, 10): [apiData[0], apiData[0]]
      };
      _selectedEvents = _events[_selectedDay] ?? [];
    });
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
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
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedEvents = _getEventsForDay(selectedDay);
              });
              widget.onDaySelected(selectedDay, focusedDay, _selectedEvents!);
            },
            eventLoader: _getEventsForDay,
            calendarStyle: const CalendarStyle(
                cellPadding: EdgeInsets.all(10.0),
                markersMaxCount: 1,
                markerSize: 10.0,
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
                cellMargin: EdgeInsets.all(5)),
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

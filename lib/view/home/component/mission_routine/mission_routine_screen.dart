import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/mission_routine_calendar.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/routine_calendar.dart';
import 'package:mojacknong_android/view/home/detail/home_content.dart';

class MissionRoutineScreen extends StatefulWidget {
  const MissionRoutineScreen({Key? key}) : super(key: key);

  @override
  State<MissionRoutineScreen> createState() => _MissionRoutineScreenState();
}

class _MissionRoutineScreenState extends State<MissionRoutineScreen> {
  late List? _selectedEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: "미션/루틴",
      ),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        children: [
          SizedBox(
            height: 370,
            child: MissionRoutineCalendar(
              onDaySelected: (selectedDay, focusedDay, selectedEvents) {
                setState(() {
                  _selectedEvents = selectedEvents;
                });
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "미션",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const HomeContent(challengeId: null, veggieNickname: '', stepNum: null, stepName: '', color: '',),
                  const HomeContent(challengeId: null, veggieNickname: '', stepNum: null, stepName: '', color: '',),
                  const HomeContent(challengeId: null, veggieNickname: '', stepNum: null, stepName: '', color: '',),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "루틴",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RoutineCalendar(selectedEvents: _selectedEvents),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/model/routine_month_dto.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/calendar_controller.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/mission_routine_calendar.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/mission_routine_controller.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/n_routine_controller.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/n_routine_list.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/routine_calendar.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/routine_list.dart';
import 'package:mojacknong_android/view/home/detail/home_content.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';

class MissionRoutineScreen extends StatefulWidget {
  const MissionRoutineScreen({Key? key}) : super(key: key);

  @override
  State<MissionRoutineScreen> createState() => _MissionRoutineScreenState();
}

class _MissionRoutineScreenState extends State<MissionRoutineScreen> {
  MissionRoutineController controller = Get.find();
  NRoutineController nRoutineController = Get.put(NRoutineController());
  CalendarController calendarController = Get.put(CalendarController());

  final GlobalKey<_MissionRoutineScreenState> _key =
      GlobalKey<_MissionRoutineScreenState>();
  bool isLoading = true;

  void resetWidget() {
    setState(() {
      fetchData();
      print("resetWidget");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() {
    controller.getMissions();
    calendarController
        .updateEvents(
            DateFormat('yyyy-MM-dd').format(DateTime.now()), DateTime.now())
        .then((value) => {
              controller.getDayEvents(value),
              nRoutineController.updateRoutines(controller.dayEvents),
              setState(() {
                isLoading = false;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: "미션/루틴",
      ),
      backgroundColor: FarmusThemeData.white,
      body: Center(
        key: _key,
        child: isLoading
            ? const CircularProgressIndicator(color: FarmusThemeData.brown)
            : Column(
                children: [
                  SizedBox(
                    height: 370,
                    child: MissionRoutineCalendar(
                      onDaySelected: (selectedDay, focusedDay, selectedEvents) {
                        print("selectedEvents: $selectedEvents");
                        setState(() {
                          controller.getDayEvents(selectedEvents);
                          nRoutineController
                              .updateRoutines(controller.dayEvents);
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
                            padding: EdgeInsets.fromLTRB(16.0, 24.0, 0.0, 16.0),
                            child: Text(
                              "미션",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          for (int i = 0;
                              i < controller.myMissionState.length;
                              i++)
                            HomeContent(
                              challengeId:
                                  controller.myMissionState[i].challengeId,
                              veggieNickname:
                                  controller.myMissionState[i].veggieNickname,
                              stepNum: controller.myMissionState[i].stepNum,
                              stepName: controller.myMissionState[i].stepName,
                              color: controller.myMissionState[i].color,
                              detailId: "0"
                            ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "루틴",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DayRoutineWidget(resetFunciton: resetWidget),
                          const SizedBox(height: 12.0)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

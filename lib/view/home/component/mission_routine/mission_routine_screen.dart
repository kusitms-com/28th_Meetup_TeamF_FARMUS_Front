import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/multi_calendar.dart';

class MissionRoutineScreen extends StatefulWidget {
  const MissionRoutineScreen({Key? key}) : super(key: key);

  @override
  State<MissionRoutineScreen> createState() => _MissionRoutineScreenState();
}

class _MissionRoutineScreenState extends State<MissionRoutineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "미션/루틴",
      ),
      backgroundColor: FarmusThemeData.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 800,
                    margin: const EdgeInsets.all(16),
                    child: const TableMultiExample()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

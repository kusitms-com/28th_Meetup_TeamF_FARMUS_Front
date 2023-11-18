import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/cycle_appbar.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/cycle_number.dart';

class CycleSetting extends StatefulWidget {
  const CycleSetting({Key? key}) : super(key: key);

  @override
  State<CycleSetting> createState() => _CycleSettingState();
}

class _CycleSettingState extends State<CycleSetting> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CycleAppBar(
        title: "주기 설정",
      ),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 75),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("물 갈아주기",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          ),
          SizedBox(height: 24),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CycleNumber()),
        ],
      ),
    );
  }
}

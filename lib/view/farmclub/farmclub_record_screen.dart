import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';

class FarmclubRecordScreen extends StatefulWidget {
  FarmclubRecordScreen({super.key});

  @override
  State<FarmclubRecordScreen> createState() => _FarmclubRecordScreenState();
}

class _FarmclubRecordScreenState extends State<FarmclubRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "함께 기록해요",
      ),
      backgroundColor: FarmusThemeData.white,
      body: Container(),
    );
  }
}

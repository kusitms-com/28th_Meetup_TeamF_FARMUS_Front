import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';

class HistoryFarmScreen extends StatelessWidget {
  final String? data;

  const HistoryFarmScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "팜클럽 히스토리",
      ),
      backgroundColor: FarmusThemeData.white,
      body: Center(
        child: Text('New page with data: $data'),
      ),
    );
  }
}

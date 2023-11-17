import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';

class HistoryVegeScreen extends StatelessWidget {
  final String? data;

  const HistoryVegeScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "채소 히스토리",
      ),
      backgroundColor: FarmusThemeData.white,
      body: Center(
        child: Text('New page with data: $data'),
      ),
    );
  }
}

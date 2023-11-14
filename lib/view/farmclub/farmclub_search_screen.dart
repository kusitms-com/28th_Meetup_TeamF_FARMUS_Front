import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';

class FarmclubSearchScreen extends StatefulWidget {
  @override
  State<FarmclubSearchScreen> createState() => _FarmclubSearchScreenState();
}

class _FarmclubSearchScreenState extends State<FarmclubSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Center(child: Text("검색")),
    );
  }
}

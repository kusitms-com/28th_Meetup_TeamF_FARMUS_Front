import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';

class FarmclubChallengeScreen extends StatefulWidget {
  const FarmclubChallengeScreen({super.key});

  @override
  State<FarmclubChallengeScreen> createState() =>
      _FarmclubChallengeScreenState();
}

class _FarmclubChallengeScreenState extends State<FarmclubChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "함께 도전해요"),
      backgroundColor: FarmusThemeData.white,
      body: Column(children: []),
    );
  }
}

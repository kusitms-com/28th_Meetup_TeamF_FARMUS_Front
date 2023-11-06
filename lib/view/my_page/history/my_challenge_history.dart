import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';

class MyChallengeHistory extends StatelessWidget {
  const MyChallengeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const Center(
        child: Text("챌린지 히스토리"),
      ),
    );
  }
}

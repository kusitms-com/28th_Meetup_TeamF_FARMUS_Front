import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class ChallengeInit extends StatelessWidget {
  const ChallengeInit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "아직 미션을 완료한 멤버가 없어요",
      style: FarmusThemeData.grey1Style13,
    );
  }
}

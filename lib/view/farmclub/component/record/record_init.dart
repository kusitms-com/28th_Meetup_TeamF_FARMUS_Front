import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class RecordInit extends StatelessWidget {
  const RecordInit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: const Text(
            "아직 일기를 공유한 멤버가 없어요",
            style: FarmusThemeData.grey1Style13,
          ),
        ),
        SizedBox(height: 16,),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: 170,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(color: FarmusThemeData.grey4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              '아직 작성한 성장일기가 없어요\n자라나는 과정을 기록해볼까요?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FarmusThemeData.grey2,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

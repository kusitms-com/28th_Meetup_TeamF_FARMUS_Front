import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class CommunityPostTime extends StatelessWidget {
  final String postTime;
  const CommunityPostTime({
    super.key,
    required this.postTime,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      postTime,
      style: const TextStyle(
        color: FarmusThemeData.grey2,
        fontSize: 12,
        fontFamily: "Pretendard",
      ),
    );
  }
}

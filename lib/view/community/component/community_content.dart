import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class CommunityContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        "방울토마토가 자라지 않습니다..왜 안자라는 걸까요? 봐주실 분 구합니다.",
        style: TextStyle(
          fontSize: 16,
          color: FarmusThemeData.dark,
          fontFamily: "Pretendard",
        ),
      ),
    );
  }
}

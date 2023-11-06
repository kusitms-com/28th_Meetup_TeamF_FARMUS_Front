import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class CommunityContent extends StatelessWidget {
  final String content;

  CommunityContent({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: FarmusThemeData.dark,
            fontFamily: "Pretendard",
          ),
        ),
      ),
    );
  }
}

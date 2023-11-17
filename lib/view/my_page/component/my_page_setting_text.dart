import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class MyPageSettingText extends StatelessWidget {
  final String text;
  const MyPageSettingText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: FarmusThemeData.darkStyle16,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

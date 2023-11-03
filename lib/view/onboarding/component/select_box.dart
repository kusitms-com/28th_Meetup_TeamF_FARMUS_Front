import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class SelectBox extends StatelessWidget {
  final String title;
  final String content;

  const SelectBox({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 82,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: FarmusThemeData.grey3,
        ),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.bold,
              color: FarmusThemeData.grey6,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: "Pretendard",
              color: FarmusThemeData.grey4,
            ),
          ),
        ],
      ),
    );
  }
}

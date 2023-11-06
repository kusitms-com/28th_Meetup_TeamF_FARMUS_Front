import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class PostCategory extends StatelessWidget {
  final String category;

  const PostCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: FarmusThemeData.background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Text(
            category,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Pretendard",
                fontSize: 10),
          ),
        ),
      ),
    );
  }
}

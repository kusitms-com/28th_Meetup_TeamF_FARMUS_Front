import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class FarmclubContent extends StatelessWidget {
  final String content;
  const FarmclubContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        child: Text(
          content,
          style: FarmusThemeData.darkStyle14,
        ),
      ),
    );
  }
}

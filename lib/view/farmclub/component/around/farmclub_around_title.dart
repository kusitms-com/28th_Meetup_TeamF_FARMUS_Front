import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class FarmclubAroundTitle extends StatelessWidget {
  final String title;
  const FarmclubAroundTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "클럽명",
            style: FarmusThemeData.grey2Style13,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: FarmusThemeData.darkStyle22,
          ),
        ],
      ),
    );
  }
}

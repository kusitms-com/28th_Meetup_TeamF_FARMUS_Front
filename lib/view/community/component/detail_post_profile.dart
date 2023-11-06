import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class DetailPostProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image/image_example_profile.png",
            width: 44,
            height: 44,
          ),
          const SizedBox(
            width: 12,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "노준국",
                style: TextStyle(color: FarmusThemeData.dark, fontSize: 16),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "10/29 16:12",
                style: TextStyle(color: FarmusThemeData.grey2, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

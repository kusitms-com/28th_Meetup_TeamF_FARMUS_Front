import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class DiaryPicture extends StatefulWidget {
  DiaryPicture({
    super.key,
  });

  @override
  State<DiaryPicture> createState() => _DiaryPictureState();
}

class _DiaryPictureState extends State<DiaryPicture> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            height: 248,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              "assets/image/image_example_community2.png",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "오늘 상훈이 새싹이 났다!! 야호",
            style: FarmusThemeData.darkStyle14,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "10/29 3:40",
            style: FarmusThemeData.grey2Style13,
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

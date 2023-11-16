import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_profile.dart';

class MissionFeed extends StatefulWidget {
  const MissionFeed({super.key});

  @override
  State<MissionFeed> createState() => _MissionFeedState();
}

class _MissionFeedState extends State<MissionFeed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        RecordProfile(nickname: "파머시치", postTime: "10/29 4:12"),
        SizedBox(
          height: 8,
        ),
        RecordPicture(like: 2.obs),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "오늘 상훈이를 심어줬어요. 앞으로 잘 자라겠죠? 다들 응원 부탁드립니다 :)",
            style: FarmusThemeData.darkStyle14,
          ),
        ),
      ],
    );
  }
}

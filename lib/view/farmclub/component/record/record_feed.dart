import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_mine_detail.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_profile.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';

import '../../../../common/farmus_theme_data.dart';
import '../../farmclub_record_screen.dart';

class RecordFeed extends StatefulWidget {
  FarmclubMineDetail? farmclubInfo;

  RecordFeed({
    super.key,
    this.farmclubInfo,
  });

  @override
  State<RecordFeed> createState() => _RecordFeedState();
}

class _RecordFeedState extends State<RecordFeed> {
  FarmclubController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FarmclubRecordScreen();
                },
              ),
            );
          },
          child: const RecordProfile(
            nickname: "파머",
            postTime: "10/29 4:12",
          ),
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FarmclubRecordScreen();
                },
              ),
            );
          },
          child: RecordPicture(
            like: _controller.like,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FarmclubRecordScreen();
                },
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~",
              style: FarmusThemeData.darkStyle14,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_diary.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_profile.dart';

import '../../../../model/farmclub_mine.dart';
import '../../../../model/farmclub_mine_detail.dart';
import '../../farmclub_record_screen.dart';

class RecordFeed extends StatelessWidget {
  final FarmclubMineDetail farmclubInfo;
  final FarmclubMine farmclubMine;

  const RecordFeed({
    Key? key,
    required this.farmclubInfo,
    required this.farmclubMine,
  }) : super(key: key);

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
          child: RecordProfile(
            nickname: "",
            postTime:  "",
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
            like: 0.obs,
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
             "",
              style: FarmusThemeData.darkStyle14,
            ),
          ),
        )
      ],
    );
  }
}

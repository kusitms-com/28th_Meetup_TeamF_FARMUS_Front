import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/component/community_post_time.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_record_screen.dart';

class RecordProfile extends StatefulWidget {
  final String nickname;
  final String postTime;
  const RecordProfile(
      {super.key, required this.nickname, required this.postTime});

  @override
  State<RecordProfile> createState() => _RecordProfileState();
}

class _RecordProfileState extends State<RecordProfile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset("assets/image/image_example_profile2.png"),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(widget.nickname, style: FarmusThemeData.darkStyle16),
            Spacer(),
            CommunityPostTime(
              postTime: widget.postTime,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/component/community_profile.dart';

class CommunityComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CommunityProfile(
                  profileImage: "assets/image/image_example_profile2.png",
                  nickname: "감자",
                  postTime: "11/6 19:01",
                ),
                Bouncing(
                  onPress: () {},
                  child: SvgPicture.asset("assets/image/ic_more_vertical.svg"),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "그건 당신이 최선을 다하지 않아서가 아닐까요? ^_____^",
              style: TextStyle(
                color: FarmusThemeData.dark,
                fontFamily: "Pretendard",
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              height: 1,
              color: FarmusThemeData.grey3,
            ),
          ],
        ),
      ),
    );
  }
}

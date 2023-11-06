import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/component/community_comment.dart';
import 'package:mojacknong_android/view/community/component/community_content.dart';
import 'package:mojacknong_android/view/community/component/community_picture.dart';
import 'package:mojacknong_android/view/community/component/detail_post_profile.dart';
import 'package:mojacknong_android/view/community/component/post_category.dart';

class DetailPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                DetailPostProfile(),
                const Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: PostCategory(
                      category: "도와주세요",
                    ),
                  ),
                ),
              ],
            ),
            CommunityContent(
              content: "방울토마토가 자라지 않습니다..\n왜 안자라는 걸까요? 봐주실 분 구합니다.",
            ),
            CommunityPicture(image: "assets/image/image_example_community.png"),
            const SizedBox(
              height: 16,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Text(
                  "댓글",
                  style: TextStyle(
                    color: FarmusThemeData.dark,
                    fontSize: 16,
                    fontFamily: "Pretendard",
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "2",
                  style: TextStyle(
                    color: FarmusThemeData.dark,
                    fontSize: 16,
                    fontFamily: "Pretendard",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            CommunityComment(),
            CommunityComment(),
          ],
        ),
      ),
    );
  }
}

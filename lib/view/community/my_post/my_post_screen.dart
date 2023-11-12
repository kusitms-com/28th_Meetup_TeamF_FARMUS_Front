import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/community/component/my_post_feed.dart';

class MyPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "내 글",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyPostFeed(
              postTime: "10/29 16:12",
              comment: "2",
              postCategory: "도와주세요",
              title: "방울토마토가 자라지 않습니다..",
              content: "왜 안자라는 걸까요? 봐주실 분 구합니다.",
              image: "assets/image/image_empty.png",
            ),
            MyPostFeed(
              postTime: "10/29 16:12",
              comment: "2",
              postCategory: "도와주세요",
              title: "방울토마토가 자라지 않습니다..",
              content: "왜 안자라는 걸까요? 봐주실 분 구합니다.",
              image: "assets/image/image_empty.png",
            ),
            MyPostFeed(
              postTime: "10/29 16:12",
              comment: "2",
              postCategory: "도와주세요",
              title: "방울토마토가 자라지 않습니다..",
              content: "왜 안자라는 걸까요? 봐주실 분 구합니다.",
              image: "assets/image/image_empty.png",
            ),
          ],
        ),
      ),
    );
  }
}

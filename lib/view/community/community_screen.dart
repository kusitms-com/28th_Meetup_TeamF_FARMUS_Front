import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/view/community/component/button_next_my_post.dart';
import 'package:mojacknong_android/view/community/component/community_category.dart';
import 'package:mojacknong_android/view/community/component/community_feed.dart';

class CommunityScreen extends StatefulWidget {
  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<String> category = <String>["도와주세요", "자랑할래요", "정보나눔"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Row(
            children: [
              ...category.map(
                (item) {
                  return CommunityCategory(category: item);
                },
              ).toList(),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ButtonNextMyPost(),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                for (int i = 0; i < 5; i++)
                  CommunityFeed(
                    profileImage: "assets/image/ic_profile.svg",
                    nickname: "노준국",
                    postTime: "11/6 12:18",
                    comment: "0",
                    postCategory: "도와주세요",
                    content: "방울토마토가 자라지 않습니다..\n왜 안자라는 걸까요? 봐주실 분 구합니다.",
                    image: "assets/image/image_example_community.png",
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

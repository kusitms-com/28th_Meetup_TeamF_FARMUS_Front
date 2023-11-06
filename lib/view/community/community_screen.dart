import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/view/community/component/button_next_my_post.dart';
import 'package:mojacknong_android/view/community/component/community_category.dart';
import 'package:mojacknong_android/view/community/component/community_feed.dart';
import 'package:mojacknong_android/view/community/component/floating_button_post.dart';
import 'package:mojacknong_android/view_model/controllers/community_feed_controller.dart';

class CommunityScreen extends StatefulWidget {
  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final CommunityFeedController feedController =
      Get.put(CommunityFeedController());

  List<String> category = <String>["도와주세요", "자랑할래요", "정보나눔"];

  List<Map<String, String>> dummyData = [
    {
      "profileImage": "assets/image/image_example_profile.png",
      "nickname": "노준국",
      "postTime": "11/6 12:18",
      "comment": "0",
      "postCategory": "도와주세요",
      "title": "방울토마토가 자라지 않습니다..",
      "content": "왜 안자라는 걸까요? 봐주실 분 구합니다.",
      "image": "assets/image/image_example_community.png",
    },
    {
      "profileImage": "assets/image/image_example_profile2.png",
      "nickname": "감자",
      "postTime": "11/6 12:18",
      "comment": "0",
      "postCategory": "자랑할래요",
      "title": "25년 생에 처음으로",
      "content": "새싹 발아에 성공했습니다. 감격스럽네요.. \n저는 이제 농약손이 아니에요 ^_____^",
      "image": "assets/image/image_example_community2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
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
            child: ListView.builder(
              itemCount: dummyData.length,
              itemBuilder: (context, index) {
                feedController.setData(
                  profileImage: dummyData[index]['profileImage']!,
                  nickname: dummyData[index]['nickname']!,
                  postTime: dummyData[index]['postTime']!,
                  comment: dummyData[index]['comment']!,
                  postCategory: dummyData[index]['postCategory']!,
                  title: dummyData[index]['title']!,
                  content: dummyData[index]['content']!,
                  image: dummyData[index]['image']!,
                );
                return CommunityFeed(
                  profileImage: feedController.profileImage.value,
                  nickname: feedController.nickname.value,
                  postTime: feedController.postTime.value,
                  comment: feedController.comment.value,
                  postCategory: feedController.postCategory.value,
                  title: feedController.title.value,
                  content: feedController.content.value,
                  image: feedController.image.value,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingButtonPost(),
    );
  }
}

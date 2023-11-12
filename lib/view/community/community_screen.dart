import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/model/community_posting.dart';
import 'package:mojacknong_android/repository/community_repository.dart';
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

  List<String> category = <String>["도와주세요", "자랑할래요", "정보나눠요"];

  List<CommunityPosting> communityPostings = [];

  @override
  void initState() {
    super.initState();
    getWholePosting();
  }

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
              SizedBox(
                width: 10,
              ),
              ...category.map(
                (item) {
                  return CommunityCategory(
                      feedController: feedController, category: item);
                },
              ).toList(),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ButtonNextMyPost(),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: communityPostings.length,
              itemBuilder: (context, index) {
                CommunityPosting posting = communityPostings[index];
                feedController.setData(
                  profileImage: posting.userImageUrl,
                  nickname: posting.nickName,
                  postTime: posting.createdAt,
                  comment: posting.commentCount.toString(),
                  postCategory: posting.tag,
                  title: posting.title,
                  content: posting.contents,
                  image: posting.postingImage.isNotEmpty
                      ? posting.postingImage[0]
                      : "",
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
      floatingActionButton: const FloatingButtonPost(),
    );
  }

  Future<void> getWholePosting() async {
    List<CommunityPosting> postings =
        await CommunityRepository.getWholePosting();
    setState(() {
      communityPostings = postings;
    });
  }
}
